class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  # before_action :logged_in_user, only: [:show, :update, :destroy]
  # before_action :correct_user,   only: [:update]
  # before_action :admin_user,     only: [:destroy, :index]

  def index
    @users = User.all
    json_response(@users)
  end

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  def show
    json_response(@user)
  end

  def update
    @user.update(todo_params)
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
