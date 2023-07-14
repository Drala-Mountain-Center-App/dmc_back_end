require 'rails_helper'

RSpec.describe 'create video with GraphQL' do
  it 'can create a video', :vcr do
    query = <<~GQL
      mutation{
        createVideo(input: {
          vimeoId: 844631799,
          speaker: "Daniel Hessey",
          topic: "Introduction to Meditation",
          dateRecorded: "2017-07-24"
      }) {
          id
          title
          description
          speaker
          topic
          length
          dateRecorded
          videoUrl
          thumbnailUrl
          embedCode
          vimeoId
        }
      }
    GQL
    results = DmcBackEndSchema.execute(query)

    expect(Video.find_by(vimeo_id: 844631799)).to be_a(Video)
    expect(Video.find_by(vimeo_id: 844631799).title).to eq("Learn to Meditate Part 2")
    expect(Video.find_by(vimeo_id: 844631799).description).to eq(nil)
    expect(Video.find_by(vimeo_id: 844631799).speaker).to eq("Daniel Hessey")
    expect(Video.find_by(vimeo_id: 844631799).topic).to eq("Introduction to Meditation")
    expect(Video.find_by(vimeo_id: 844631799).length).to eq("00:08:20")
    expect(Video.find_by(vimeo_id: 844631799).date_recorded).to eq("2017-07-24")
    expect(Video.find_by(vimeo_id: 844631799).video_url).to eq("https://vimeo.com/844631799")
    expect(Video.find_by(vimeo_id: 844631799).thumbnail_url).to be_a(String)
    expect(Video.find_by(vimeo_id: 844631799).embed_code).to be_a(String)

    expect(results.dig("data", "createVideo", "id")).to be_a(String)
    expect(results.dig("data", "createVideo", "title")).to eq("Learn to Meditate Part 2")
    expect(results.dig("data", "createVideo", "description")).to eq(nil)
    expect(results.dig("data", "createVideo", "speaker")).to eq("Daniel Hessey")
    expect(results.dig("data", "createVideo", "topic")).to eq("Introduction to Meditation")
    expect(results.dig("data", "createVideo", "length")).to eq("00:08:20")
    expect(results.dig("data", "createVideo", "dateRecorded")).to eq("2017-07-24")
    expect(results.dig("data", "createVideo", "videoUrl")).to eq("https://vimeo.com/844631799")
    expect(results.dig("data", "createVideo", "thumbnailUrl")).to be_a(String)
    expect(results.dig("data", "createVideo", "embedCode")).to be_a(String)
    expect(results.dig("data", "createVideo", "vimeoId")).to eq(844631799)
  end
end