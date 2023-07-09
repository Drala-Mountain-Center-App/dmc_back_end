require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email)}
    it { is_expected.to validate_presence_of(:member) }
  end

  describe 'Relationships' do
    it { should have_many(:meditations).dependent(:destroy) }
  end
end