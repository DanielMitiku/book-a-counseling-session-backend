require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:appointments) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:email) }
end
