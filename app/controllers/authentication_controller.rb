class AuthenticationController < ApplicationController
  skip_before_action :authorize_request

  def authenticate
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    @user = User.find_by(email: params[:email])
    user_response = { auth_token: auth_token, user: { first_name: @user.first_name, last_name: @user.last_name, email: @user.email, is_privileged: @user.is_privileged } }
    json_response(user_response)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
