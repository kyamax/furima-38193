class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    # binding.pry
    if @order_form.valid?
      # Payjp.api_key = "sk_test_61eefc9f9d19b2a7903c3705"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      # Payjp::Charge.create(
      #   amount: order_params[:price],  # 商品の値段
      #   card: order_params[:token],    # カードトークン
      #   currency: 'jpy'                 # 通貨の種類（日本円）
      # )
      @order_form.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :city, :address1, :address2, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end
