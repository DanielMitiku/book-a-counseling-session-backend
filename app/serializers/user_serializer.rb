class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :is_privileged
  has_many :appointments
end
