class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'    # バリデーションに弾かれた時
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
    redirect_to root_path
    else
    redirect_to root_path, alert: "削除が失敗しました"
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :price, :category_id, :condition_id, :prefecture_id, :estimated_shipping_id, :postage_fee_id).merge(user_id: current_user.id)
  end
end
