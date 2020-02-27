class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authorize_request, only: :create

  # before_action :logged_in_user, only: [:show, :update, :destroy]
  # before_action :correct_user,   only: [:update]
  # before_action :admin_user,     only: [:destroy, :index]

  def index
    @users = User.all
    json_response(@users.paginate(page: params[:page], per_page: 20))
  end

  def create
    @user = User.create!(user_params)
    auth_token = AuthenticateUser.new(@user.email, @user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  def show
    json_response(@user)
  end

  def update
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
