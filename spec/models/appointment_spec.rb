require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:counseling_id) }
  it { should belong_to(:user) }
  it { should belong_to(:counseling) }
end
