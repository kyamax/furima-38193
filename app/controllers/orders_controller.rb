class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    # @address = Address.new
    @order_form = OrderForm.new
  end

  def create
    binding.pry
    @item = Item.find(params[:item_id])
    # @address = Address.create(address_params)
    @order_form = OrderForm.new(order_params)
    # Order.create(order_params)
    # if @address.valid?
    if @order_form.valid?
      # Payjp.api_key = "sk_test_61eefc9f9d19b2a7903c3705"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      # Payjp::Charge.create(
      #   amount: order_params[:price],  # 商品の値段
      #   card: order_params[:token],    # カードトークン
      #   currency: 'jpy'                 # 通貨の種類（日本円）
      # )
      @order_form.save
      # @address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  # def address_params
  #   params.permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :address1, :address2, :phone_number)

  def order_params
    params.permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :address1, :address2, :phone_number)
    # params.require(:address).permit(:post_code, :prefecture_id, :city, :address1, :address2, :phone_number, :item_id).merge(token: params[:token])
  end

  # def order_params
  #   params.permit(:user_id, :item_id)
  # end
  
end
