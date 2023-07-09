require 'rails_helper'

RSpec.describe Meditation, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:total_sitting_time) }
  end

  describe 'Relationships' do
    it { should belong_to(:user) }
  end
end