class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
  end
  def create
    
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :info, :price, :category_id, :sales_stasus_id, :shopping_fee_status_id, :prefecture_id, :scheduled_delicery_id)
  end
end
