require 'rails_helper'

RSpec.describe 'create meditation with GraphQL by sending in email' do
  describe 'happy path' do
    before(:each) do
      @user = User.create!(first_name: "Reid", last_name: "Miller", email: "reid@gmail.com", member: true, password: "password123")
    end

    it 'can create a meditation and send meditation and user info back' do
      query = <<~GQL
        mutation{
          createMeditationByEmail(input: {
            totalSittingTime: 1187,
            userEmail: "reid@gmail.com"
          }) {
            id
            totalSittingTime
            createdAt
            completedBy {
              id
              firstName
            }
          }
        }
      GQL
      results = DmcBackEndSchema.execute(query)
      expect(results.dig("data", "createMeditationByEmail", "totalSittingTime")).to eq(1187)
      expect(results.dig("data", "createMeditationByEmail", "completedBy", "firstName")).to eq("Reid")
    end
  end

  describe "sad path" do
    before(:each) do
      @user = User.create!(first_name: "Reid", last_name: "Miller", email: "reid@gmail.com", member: true, password: "password123")
    end
    it "if email sent does not pertain to user, error is sent" do
        query = <<~GQL
        mutation{
          createMeditationByEmail(input: {
            totalSittingTime: 1187,
            userEmail: "red@gmail.com"
          }) {
            id
            totalSittingTime
            createdAt
            completedBy {
              id
              firstName
            }
          }
        }
      GQL
      results = DmcBackEndSchema.execute(query)
      error = results.dig("errors").first
      expect(error["message"]).to eq("Invalid input: User must exist")
    end
  end
end