class ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
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
    @product = Product.create(product_params)
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
    params.permit(:name, :description, :price)
  end
end
