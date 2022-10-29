class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
    redirect_to root_path if @item.order.present? || current_user.id == @item.user_id
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :city, :address1, :address2, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],  
      card: order_params[:token],   
      currency: 'jpy'                 
    )
  end

  
end
