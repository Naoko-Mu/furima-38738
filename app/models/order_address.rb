class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :state_id, :city, :street_address, :building_name, :phone_number, :user_id, :order_id, :item_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
  end
  validates :state_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Destination.create(zip_code: zip_code, state_id: state_id, city: city, street_address: street_address, building_name: building_name,
                       phone_number: phone_number, order_id: order.id)
  end
end
