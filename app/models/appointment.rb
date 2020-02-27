class Appointment < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  belongs_to :counseling

  validates :user_id, presence: true
  validates :counseling_id, presence: true

end
