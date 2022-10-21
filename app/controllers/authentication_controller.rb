class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { errors: command.errors }, status: :unauthorized
    end
  end

  def log_out
    @user = User.find(params[:id])
    
  end
end
