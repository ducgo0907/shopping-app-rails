class ShopsController < ApplicationController
    skip_before_action :authenticate_request, only: [:index, :show]
  def index
    @shops = Shop.all
    render json: @shops
  end

  def show
    @shops = Shop.find(params[:id])
    @products = @shops.products
    render json: {
        shop: @shops,
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
