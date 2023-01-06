class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

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
  end

  def edit
    if current_user.id == @item.user.id
      render 'edit'
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :price, :category_id, :condition_id, :shipping_cost_id, :state_id,
                                 :date_of_shipment_id, :description).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
