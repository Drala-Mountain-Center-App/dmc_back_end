require "rails_helper"

RSpec.describe "Mutation create User" do
  it "creates a user" do
    query = <<~GQL
    mutation{
      createUser(input: {
          firstName: "Redo",
          lastName: "Muller",
          member: false,
          authProvider: {
            credentials: {
              email: "bestreadymuller@hotmail.com",
              password: "password123",
              passwordConfirmation: "password123"
            }
          }
      }) {
      id
      firstName
      lastName
      email
      member
      }
  }
  GQL
  DmcBackEndSchema.execute(query)

  expect(User.find_by(email: "bestreadymuller@hotmail.com")).to be_a(User)
  end
end

