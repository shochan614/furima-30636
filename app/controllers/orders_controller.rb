class OrdersController < ApplicationController
  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(user_order_params)
    if @user_order.valid?
      @item = Item.find(params[:item_id])
       pay_item
       @user_order.save
       redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def user_order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: user_order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
