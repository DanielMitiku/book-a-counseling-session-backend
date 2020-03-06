class Counseling < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :image_url, presence: true
end
