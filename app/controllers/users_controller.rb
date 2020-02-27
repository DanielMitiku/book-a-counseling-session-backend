class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  # before_action :logged_in_user, only: [:show, :update, :destroy]
  # before_action :correct_user,   only: [:update]
  # before_action :admin_user,     only: [:destroy, :index]

  def index
    @user = User.all
    
  end

  def show
  end

  def update
    
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
