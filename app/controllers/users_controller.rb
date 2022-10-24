class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def show
    user = User.find(params[:id])

    render json: {
      user: user.attributes.except("password_digest")
    }
  end

  def create
    user = User.create(user_params)

    if user.save
      render json: {
        status: :created,
        user: user.attributes.except("password_digest"),
      }
    else
      render json: {
        errors: user.errors,
        status: 500,
      }
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      render json: {
        status: :editted,
        user: user.attributes.except("password_digest"),
      }
    else
      render json: {
        errors: user.errors,
        status: 500,
      }
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
