class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
    
    if command.success?
      @current_user = User.find_by(email: params[:email])
      render json: { 
        auth_token: command.result, 
        is_logged: true,
        user_name: @current_user.name,
        user_id: @current_user.id,
        shop_id: @current_user.shops.map(&:id)
      }
    else
      render json: { 
        errors: command.errors, 
        status: :unauthorized,
        is_logged: false,
      }
    end
  end
end
