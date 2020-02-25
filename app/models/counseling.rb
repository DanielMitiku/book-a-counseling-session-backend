class Counseling < ApplicationRecord
  has_many :appointments
  has_many :users, :through => :appointments

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 25 }

end
