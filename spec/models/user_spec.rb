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

    describe 'total_meditation_time' do
      it "shows total amount of time spent meditating in hour::minutes format" do
        @user = User.create!(first_name: "Reid", last_name: "Miller", email: "reid@gmail.com", member: true, password: "password123")
        @user2 = User.create!(first_name: "Reid", last_name: "Miller", email: "rd@gmail.com", member: true, password: "password123")
        @user_meditations = create_list(:meditation, 25, user_id: @user.id)

        expect(@user.meditations.sum(:total_sitting_time)).to eq(30000)
        expect(@user.total_meditation_time).to eq("8 hours 20 minutes")
      end

      it "format_time method converts seconds into readable format" do
        @user = User.create!(first_name: "Reid", last_name: "Miller", email: "reid@gmail.com", member: true, password: "password123")

        expect(@user.format_time(30000)).to eq("8 hours 20 minutes")
        expect(@user.format_time(60)).to eq("1 minute")
        expect(@user.format_time(100000)).to eq("27 hours 46 minutes 40 seconds")
        expect(@user.format_time(1200)).to eq("20 minutes")
      end
    end

    describe 'average_meditation_time' do
      it "provides the average time of a users meditation sessions" do
        @user = User.create!(first_name: "Reid", last_name: "Miller", email: "reid@gmail.com", member: true, password: "password123")
        @user2 = User.create!(first_name: "Reid", last_name: "Miller", email: "rd@gmail.com", member: true, password: "password123")
        @user_meditations = create_list(:meditation, 25, user_id: @user.id)
        @user2_meditations = create_list(:meditation, 25, user_id: @user2.id, total_sitting_time: 1000)

        expect(@user.average_meditation_time).to eq("20 minutes")
        expect(@user2.average_meditation_time).to eq("16 minutes 40 seconds")
      end
    end
  end
end