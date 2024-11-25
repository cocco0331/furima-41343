class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :product_condition_id, :shipping_cost_id, :shipping_date_id,
                                 :delivery_region_id, :price, :image).merge(user_id: current_user.id)
  end
end
