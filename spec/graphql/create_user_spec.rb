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
              password: "password123"
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
    result = DmcBackEndSchema.execute(query)
    expect(User.find_by(email: "bestreadymuller@hotmail.com")).to be_a(User)
  end

  it "if user email is not unique/user already exists with that email, error message is sent" do
    User.create!(first_name: 'logan', last_name: 'logan', email: 'loganlogan@gmail.com', member: false )
    query = <<~GQL
    mutation{
      createUser(input: {
          firstName: "Redo",
          lastName: "Muller",
          email: "loganlogan@gmail.com",
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
    error = result.dig("errors").first
    expect(error["message"]).to eq("Invalid input: Email has already been taken")
  end

  it "if any field is blank, error message is sent" do
    query = <<~GQL
    mutation{
      createUser(input: {
          firstName: "",
          lastName: "logan",
          email: "loganlogan@gmail.com",
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
    error = result.dig("errors").first
    expect(error["message"]).to eq("Invalid input: First name can't be blank")

    query = <<~GQL
    mutation{
      createUser(input: {
          firstName: "logan",
          lastName: "",
          email: "loganlogan@gmail.com",
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
    error = result.dig("errors").first
    expect(error["message"]).to eq("Invalid input: Last name can't be blank")

    query = <<~GQL
    mutation{
      createUser(input: {
          firstName: "logan",
          lastName: "Cole",
          email: "",
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
    error = result.dig("errors").first
    expect(error["message"]).to eq("Invalid input: Email can't be blank")
  end

  it "Input has invalid value, error message is sent" do
    query = <<~GQL
    mutation{
      createUser(input: {
          firstName: "logan",
          lastName: "Cole",
          email: "happy@happy.com",
          member: nil
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
    error = result.dig("errors").first
    expect(error["message"]).to eq("Argument 'member' on InputObject 'CreateUserInput' has an invalid value (nil). Expected type 'Boolean!'.")
  end

  it "If required attribute is not provided, error message is sent" do
    query = <<~GQL
    mutation{
      createUser(input: {
          firstName: "logan",
          lastName: "Cole",
          email: "happy@happy.com",
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
    error = result.dig("errors").first
    expect(error["message"]).to eq("Argument 'member' on InputObject 'CreateUserInput' is required. Expected type Boolean!")
  end

  it "if input is not provided before attributes in a hash format, error message is sent" do
    query = <<~GQL
    mutation{
      createUser(
          firstName: "logan",
          lastName: "Cole",
          email: "happy@happy.com",
      ) {
      id
      firstName
      lastName
      email
      member
      }
    }
    GQL
    result = DmcBackEndSchema.execute(query)
    error = result.dig("errors").first
    expect(error["message"]).to eq("Field 'createUser' is missing required arguments: input")
  end

  it "if non-existing attribute is passed in, error message is sent" do
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
      pants_size
      }
    }
    GQL
    result = DmcBackEndSchema.execute(query)
    error = result.dig("errors").first
    expect(error["message"]).to eq("Field 'pants_size' doesn't exist on type 'User'")
  end
end
