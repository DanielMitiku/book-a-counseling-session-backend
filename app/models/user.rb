class User < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :counselings, :through => :appointments

  has_secure_password

  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates_presence_of :password_digest

  def is_admin
    self.is_privileged
  end

end
