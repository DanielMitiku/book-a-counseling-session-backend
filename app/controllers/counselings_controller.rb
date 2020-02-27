class CounselingsController < ApplicationController
  before_action :set_counseling, only: [:show, :update, :destroy] 
  before_action :admin_user

  def index
    @counselings = Counseling.all
    json_response(@counselings.paginate(page: params[:page], per_page: 20))
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

  def admin_user
    if (!current_user.is_admin)
      json_response({ message: "not authorized" }, :unauthorized)
    end
  end

end
