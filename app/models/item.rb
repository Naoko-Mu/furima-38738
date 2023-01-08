class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :state
  belongs_to :date_of_shipment
  has_one :order

# with_optionsは複数のバリデーションをグループ化し、共通の制限をかけるためのメソッドです。最後に修正する
  validates :image, presence: true
  validates :item_name, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :date_of_shipment_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :description, presence: true

  belongs_to :user
  has_one_attached :image
end
