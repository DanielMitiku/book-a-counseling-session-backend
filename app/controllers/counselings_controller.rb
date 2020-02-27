class CounselingsController < ApplicationController
  before_action :set_counseling, only: [:show, :update, :destroy]
  # before_action :logged_in_user, only: [:show, :update, :destroy]
  # before_action :correct_user,   only: [:update]
  # before_action :admin_user,     only: [:destroy, :index]

  def index
    @counselings = Counseling.all
    json_response(@counselings)
  end

  def create
    @counseling = Counseling.create!(counseling_params)
    json_response(@counseling, :created)
  end

  def show
    json_response(@counseling)
  end

  def update
    @user.update(counseling_params)
    head :no_content
  end

  def destroy
    @counseling.destroy
    head :no_content
  end

  private

  def counseling_params
    params.permit(:name, :description)
  end

  def set_counseling
    @counseling = Counseling.find(params[:id])
  end
end
