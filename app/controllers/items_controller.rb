class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
    redirect_to new_user_session_path unless user_signed_in?
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
    @item = Item.find_by(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :shipping_charges_id, :prefecture_id,
                                 :days_id, :price).merge(user_id: current_user.id)
  end
end
