require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email)}
    it { is_expected.to validate_presence_of(:member) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'Relationships' do
    it { should have_many(:meditations).dependent(:destroy) }
  end

  describe 'Statistics' do
    describe 'total_meditations' do
      it "provides the total meditations that a user has completed through the app" do
        @user = User.create!(first_name: "Reid", last_name: "Miller", email: "reid@gmail.com", member: true, password: "password123")
        @user2 = User.create!(first_name: "Reid", last_name: "Miller", email: "rd@gmail.com", member: true, password: "password123")
        @user_meditations = create_list(:meditation, 25, user_id: @user.id)

        expect(@user_meditations.count).to eq(25)
        expect(@user.total_meditations).to eq(25)
        expect(@user2.total_meditations).to eq(0)
      end
    end
  end
end