class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :shipping_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :delivery_id, numericality: { other_than: 1 }
end
