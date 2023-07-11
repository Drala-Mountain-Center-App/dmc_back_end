require 'rails_helper'

RSpec.describe 'create meditation with GraphQL' do
  describe 'happy path' do
    before(:each) do
      @user = User.create!(first_name: "Reid", last_name: "Miller", email: "reid@gmail.com", member: true, password: "password123")
      @mutation = Mutations::SignInUser.new(object: nil, field: nil, context: { session: {} })

      credentials = { email: 'reid@gmail.com', password: 'password123' }
      mutation.resolve(credentials: credentials)
    end

    xit 'can create a meditation and send meditation and user info back' do
      query = <<~GQL
        mutation{
          createMeditation(input: {
            totalSittingTime: 1187
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

      expect(results.dig)
    end
  end
end