class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :counseling

  validates :user_id, presence: true
  validates :counseling_id, presence: true

end
