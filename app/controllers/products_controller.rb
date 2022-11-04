class ProductsController < ApplicationController
  skip_before_action :authenticate_request, only: [:index, :show, :products_in_range]

  def index
    @products = Product.all.order("id")
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def products_in_range
    @products = Product.where("price between ? and ?", params[:min], params[:max])
    render json: @products
  end

  def search
    key = "%#{params[:key]}%"
    @products = Product.where("name like ?", key)
    render json: @products
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    if @product.save
      render json: Product.all
    else
      render json: "Can's update product!"
    end
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @product = @shop.products.create(product_params)
    if @product.save
      render json: @product
    else
      render json: "Can's create product!"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    @products = Product.all
    render json: @products
  end

  private

  def product_params 
    params.require(:product).permit(:name, :description, :price, :image)
  end

end
