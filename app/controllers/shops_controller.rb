class ShopsController < ApplicationController
  skip_before_action :authenticate_request, only: [:index, :show]
  def index
    @shops = Shop.where("user_id = ?", params[:id])
    render json: @shops
  end

  def show
    @shop = Shop.find(params[:id])
    @products = @shop.products
    render json: {
        shop: @shop,
        products: @products
    }
  end

  def create
    @shop = current_user.shops.create(shop_params)
    if @shop.save
      render json: @shop
    else
      render json: "Can create product!!"
    end
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :image)
  end
end
