class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end


  private

def item_params
    params.require(:item).permit(:image, :item_name, :price, :category_id, :condition_id, :shipping_cost_id, :state_id, :date_of_shipment_id, :description).merge(user_id: current_user.id)
  end

end
