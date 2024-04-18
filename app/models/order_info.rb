class OrderInfo
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :address, :building, :phone_number, :order_id

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }, length: { in: 10..11 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Info.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building: building,
                       phone_number: phone_number, order_id: order.id)
  end
end
