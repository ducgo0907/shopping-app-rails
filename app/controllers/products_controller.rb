class ProductsController < ApplicationController
  before_action :logged_in, only: [:update, :create, :destroy]
  skip_before_action :authenticate_request, only: [:index, :show]

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
    @product = current_user.products.create(product_params)
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
    params.require(:product).permit(:name, :description, :price)
  end

  def logged_in
    render json: { Authorized: "You need to login to do it" , ss_id: session[:user_id]} unless !current_user.nil?
  end
end
