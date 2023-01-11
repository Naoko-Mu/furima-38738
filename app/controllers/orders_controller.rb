class OrdersController < ApplicationController
  before_action :set_item

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
private

  def set_item
    @item = Item.find(params[:item_id])
  end


  def order_params
    params.require(:order_address).permit(:zip_code, :state_id, :city, :street_address, :building_name, :phone_number, :user_id, :order_id, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

end