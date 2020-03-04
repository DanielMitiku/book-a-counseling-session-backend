class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :is_privileged, :user_appointments
  #has_many :appointments
  #has_many :counselings
  def user_appointments
    self.object.appointments.map do |a|
      {appointment_id: a.id,
       appointment_date: a.date.strftime("%a %l:%M %p %d %b %Y"),
       counseling_id: a.counseling.id,
       counseling_name: a.counseling.name,
       counseling_desc: a.counseling.description}
    end
  end
end
