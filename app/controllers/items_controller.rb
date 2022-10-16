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

  def edit
    @item = Item.find_by(params[:id])
    redirect_to new_user_session_path unless user_signed_in?
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find_by(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :shipping_charges_id, :prefecture_id,
                                 :days_id, :price).merge(user_id: current_user.id)
  end
end
