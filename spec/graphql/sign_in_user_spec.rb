require 'rails_helper'

RSpec.describe 'sign in user with GraphQL' do
  describe 'happy path' do
    before(:each) do
      @user = User.create!(first_name: "Reid", last_name: "Miller", email: "reid@gmail.com", member: true, password: "password123")
    end

    it 'can sign in a user and send user info back' do
      query = <<~GQL
      mutation{
        signInUser( input: {
          credentials: {
            email: "reid@gmail.com",
            password: "password123"
          }
        }
        ) {
          token
          user {
            id
          }
        }
      }
      GQL
      results = DmcBackEndSchema.execute(query)

      expect(results.dig("data", "signInUser", "token")).to be_a(String)
      expect(results.dig("data", "signInUser", "token").length).to eq(72)
      expect(results.dig("data", "signInUser", "user", "id").to_i).to eq(@user.id)
    end
  end
end