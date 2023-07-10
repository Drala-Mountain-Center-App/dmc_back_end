require "rails_helper"

RSpec.describe "User" do
  describe "all_users" do
    it "retrieves all users" do
      User.create!(first_name: 'Alejandro', last_name: 'last_name', email: 'email@email.email', member: true )
      User.create!(first_name: 'logan', last_name: 'logan', email: 'loganlogan@gmail.com', member: false )
        query = <<~GQL
        query{
        allUsers {
        id
        firstName
        lastName
        email
        member
        }
      }
      GQL
      result = DmcBackEndSchema.execute(query)
      
      expect(User.all.count).to eq(2)
      result.dig("data", "allUsers").each do |user|
        expect(user).to have_key("id")
        expect(user["id"]).to_not eq(nil)

        expect(user).to have_key("firstName")
        expect(user["firstName"]).to_not eq(nil)

        expect(user).to have_key("lastName")
        expect(user["lastName"]).to_not eq(nil)

        expect(user).to have_key("email")
        expect(user["email"]).to_not eq(nil)

        expect(user).to have_key("member")
        expect(user["member"]).to_not eq(nil)
      end
    expect(result.dig("data", "allUsers").length).to eq(2)
    end

    it "if no attributes are passed into query, error message is sent" do
      User.create!(first_name: 'Alejandro', last_name: 'last_name', email: 'email@email.email', member: true )
      User.create!(first_name: 'logan', last_name: 'logan', email: 'loganlogan@gmail.com', member: false )
        query = <<~GQL
        query{
        allUsers {
        }     
      }
      GQL
      result = DmcBackEndSchema.execute(query)
      errors = result.dig("errors").first
      expect(errors["message"]).to eq("Parse error on \"}\" (RCURLY) at [3, 3]")
    end

    it "if incorrect attribute is passed into query, error message is sent" do
      User.create!(first_name: 'Alejandro', last_name: 'last_name', email: 'email@email.email', member: true )
      User.create!(first_name: 'logan', last_name: 'logan', email: 'loganlogan@gmail.com', member: false )
        query = <<~GQL
        query{
        allUsers {
          id
          firstName
          lastName
          email
          member
          football
        }
      }
      GQL
      result = DmcBackEndSchema.execute(query)
      errors = result.dig("errors").first
      expect(errors["message"]).to eq("Field 'football' doesn't exist on type 'User'")
    end
  end

  describe "user_by_email" do
    it "retreives user by email" do
      user = User.create!(first_name: 'Alejandro', last_name: 'last_name', email: 'email@email.email', member: true )
        query = <<~GQL
        query{
        userByEmail(email: "email@email.email") {
        id
        firstName
        lastName
        email
        member
        }
      }
      GQL
      result = DmcBackEndSchema.execute(query)

      expect(user.first_name).to eq(result.dig("data", "userByEmail", "firstName"))
      expect(user.email).to eq(result.dig("data", "userByEmail", "email"))
    end

    it "if email is not linked to a user, error message is sent" do
      user = User.create!(first_name: 'Alejandro', last_name: 'last_name', email: 'email@email.email', member: true )
        query = <<~GQL
        query{
        userByEmail(email: "wrongemail@gmail.com") {
        id
        firstName
        lastName
        email
        member
        }
      }
      GQL
      result = DmcBackEndSchema.execute(query)
      errors = result.dig("errors").first
      expect(errors["message"]).to eq("Invalid input: Couldn't find User with 'email'=wrongemail@gmail.com")
    end
  end

  describe "user" do
    it "retreives user by id" do
      user = User.create!(first_name: 'Alejandro', last_name: 'last_name', email: 'email@email.email', member: true )
      query = <<~GQL
      query{
      user(id: "#{user.id}") {
      id
      firstName
      lastName
      email
      member
      }
    }
    GQL
    result = DmcBackEndSchema.execute(query)

    expect(user.first_name).to eq(result.dig("data", "user", "firstName"))
    expect(user.email).to eq(result.dig("data", "user", "email"))
    end

    it "if passed ID does not exist, error is sent" do
      user = User.create!(first_name: 'Alejandro', last_name: 'last_name', email: 'email@email.email', member: true )
      query = <<~GQL
      query{
      user(id: 10) {
      id
      firstName
      lastName
      email
      member
      }
    }
    GQL
    result = DmcBackEndSchema.execute(query)
    errors = result.dig("errors").first
    expect(errors["message"]).to eq("Invalid input: Couldn't find User with 'id'=10")
    end
  end
end

