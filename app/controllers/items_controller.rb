class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :item_set, only: [:show, :destroy, :edit, :update]
  def index
    @items = Item.all.order('created_at DESC')
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

  def destroy
    if @item.user.id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_set
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :info, :price, :category_id, :sales_status_id, :shopping_fee_status_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end
end
