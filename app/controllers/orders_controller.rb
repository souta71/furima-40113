class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_info = OrderInfo.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_info = OrderInfo.new(order_params)
    if @order_info.valid?
      @order_info.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_info).permit(:postal_code, :area_id, :city, :address, :building,
                                              :phone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
