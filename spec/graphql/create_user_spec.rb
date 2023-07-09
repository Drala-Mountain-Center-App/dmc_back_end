require "rails_helper"

RSpec.describe "Mutation create User" do
  it "creates a user" do
    query = <<~GQL
    mutation{
      createUser(input: {
          firstName: "Redo",
          lastName: "Muller",
          email: "bestreadymuller@hotmail.com",
          member: false
      }) {
      id
      firstName
      lastName
      email
      member
      }
  }
  GQL
  result = DmcBackEndSchema.execute(query)
  expect(User.find_by(email: "bestreadymuller@hotmail.com")).to be_a(User)
  end
end
