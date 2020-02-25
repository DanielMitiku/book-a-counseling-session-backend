class User < ApplicationRecord
  has_many :appointments
  has_many :counselings, :through => :appointments
end
