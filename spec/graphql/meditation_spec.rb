require "rails_helper"

RSpec.describe "Meditation" do
  describe "all_meditations" do
    let(:user) { (create(:user)) }
    before { allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user) }

    xit "retrieves all meditations for signed in user" do
      Meditation.create!(user_id: current_user.id, total_sitting_time: 3834)
      Meditation.create!(user_id: current_user.id, total_sitting_time: 1000)

      # allow_any_instance_of(GraphqlController).to receive(:current_user).and_return(user)
      query = <<~GQL
      query {
      allMeditations {
        id
        totalSittingTime
        createdAt
        completedBy {
            id
            firstName
            lastName
            email
            member
              }
          }
      }
    GQL
    result = DmcBackEndSchema.execute(query)
    
    result.dig("data", "allMeditations").each do |meditation|
        expect(meditation).to have_key("id")
        expect(meditation["id"]).to_not eq(nil)

        expect(meditation).to have_key("totalSittingTime")
        expect(meditation["totalSittingTime"]).to_not eq(nil)

        expect(meditation).to have_key("createdAt")
        expect(meditation["createdAt"]).to_not eq(nil)

        expect(meditation).to have_key("completedBy")
        expect(meditation["completedBy"]).to_not eq(nil)
      end
    expect(result.dig("data", "allMeditations").length).to eq(2)
    end
  end
end