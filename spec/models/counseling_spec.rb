require 'rails_helper'

RSpec.describe Counseling, type: :model do
  it { should have_many(:appointments) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
end
