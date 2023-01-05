class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
   @item.update(item_params)
   render :show

  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :price, :category_id, :condition_id, :shipping_cost_id, :state_id,
                                 :date_of_shipment_id, :description).merge(user_id: current_user.id)
  end
end
