class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def create
    user = User.create(user_params)

    if user.save
      render json: {
        status: :created,
        user: user,
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
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
