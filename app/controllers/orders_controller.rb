class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :out_user, only: [:index]
  before_action :out_user2, only: [:index]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_info = OrderInfo.new
  end

  def create
    @order_info = OrderInfo.new(order_params)
    if @order_info.valid?
      pay_item
      @order_info.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_info).permit(:postal_code, :area_id, :city, :address, :building,
                                       :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],
                                                            token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def out_user
    return unless current_user == @item.user

    redirect_to root_path
  end

  def out_user2
    return unless @item.order.present?

    redirect_to root_path
  end
end
