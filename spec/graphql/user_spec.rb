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
  end
end

