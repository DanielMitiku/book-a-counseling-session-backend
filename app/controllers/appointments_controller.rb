class AppointmentsController < ApplicationController
  before_action :set_user, except: %i[all]
  before_action :set_user_appointment, only: %i[show update destroy]
  before_action :correct_user, except: %i[all]
  before_action :admin_user, only: %i[all]

  def all
    @all_appointments = Appointment.all
    json_response(@all_appointments.map do |a|
      { appointment_id: a.id,
        appointment_date: a.date.strftime('%a %l:%M %p %d %b %Y'),
        counseling_id: a.counseling.id,
        counseling_name: a.counseling.name,
        counseling_desc: a.counseling.description,
        counseling_img: a.counseling.image_url,
        user_id: a.user.id,
        user_name: a.user.first_name + ' ' + a.user.last_name,
        user_email: a.user.email }
    end)
  end

  def index
    json_response(@user.appointments.paginate(page: params[:page], per_page: 20))
  end

  def show
    json_response(@appointment)
  end

  def create
    @user.appointments.create!(appointment_params)
    appointment = @user.appointments.first
    json_response({ appointment: appointment }, :created)
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
    json_response({ message: 'not authorized' }, :unauthorized) if current_user != @user && !current_user.admin?
  end

  def admin_user
    json_response({ message: 'not authorized' }, :unauthorized) unless current_user.admin?
  end
end
