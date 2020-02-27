class AppointmentsController < ApplicationController
  before_action :set_user
  before_action :set_user_appointment, only: [:show, :update, :destroy]
  before_action :correct_user

  def index
    json_response(@user.appointments.paginate(page: params[:page], per_page: 20))
  end

  def show
    json_response(@appointment)
  end

  def create
    @user.appointments.create!(appointment_params)
    json_response(@appointment, :created)
  end

  def update
    @appointment.update(appointment_params)
    head :no_content
  end

  def destroy
    @appointment.destroy
    head :no_content
  end

  private

  def appointment_params
    params.permit(:date, :counseling_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_appointment
    @appointment = @user.appointments.find_by!(id: params[:id]) if @user
  end

  def correct_user
    if(current_user != @user && !current_user.is_admin)
      json_response({ message: "not authorized" }, :unauthorized)
    end
  end

end
