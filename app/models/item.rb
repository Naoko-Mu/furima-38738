class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :conditin
belongs_to :shipping_cost

validates :image,         presence: true
validates :item_name, presence: true
validates :price, presence: true
validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
validates :condition_id, presence: true
validates :shipping_cost_id, presence: true
validates :state_id, presence: true
validates :date_of_shipment_id, presence: true
validates :description, presence: true


belongs_to :user


end
