require "rails_helper"

RSpec.describe "User" do
  describe "all_users" do
    it "retrieves all users" do
      User.create!(first_name: 'Alejandro', last_name: 'last_name', email: 'email@email.email', member: true, password: 'password123', password_confirmation: 'password123')
      User.create!(first_name: 'logan', last_name: 'logan', email: 'loganlogan@gmail.com', member: false, password: 'banana123', password_confirmation: 'banana123')
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
  end

  describe "user_by_email" do
    it "retreives user by email" do
      user = User.create!(first_name: 'Alejandro', last_name: 'last_name', email: 'email@email.email', member: true, password: 'password123', password_confirmation: 'password123')
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
  end

  describe "user" do
    it "retreives user by id" do
      user = User.create!(first_name: 'Alejandro', last_name: 'last_name', email: 'email@email.email', member: true, password: 'password123', password_confirmation: 'password123')
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
  end
end

