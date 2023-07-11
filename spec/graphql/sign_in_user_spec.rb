require 'rails_helper'

RSpec.describe 'sign in user with GraphQL' do
  describe 'happy path' do
    before(:each) do
      @user = User.create!(first_name: "Reid", last_name: "Miller", email: "reid@gmail.com", member: true, password: "password123")
    end

    it 'can sign in a user and send user info back' do
      mutation = Mutations::SignInUser.new(object: nil, field: nil, context: { session: {} })

      credentials = { email: 'reid@gmail.com', password: 'password123' }
      result = mutation.resolve(credentials: credentials)

      expect(result[:token]).to be_present
      expect(mutation.context[:session][:token]).to eq(result[:token])
    end
  end
end