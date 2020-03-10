class Appointment < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  belongs_to :counseling

  validates :user_id, presence: true
  validates :counseling_id, presence: true
  validates :date, presence: true
  validate :date_cannot_be_past

  private

  def date_cannot_be_past
    errors.add(:date, 'can not be in the past.') if date.present? && date < Date.today
  end
end
