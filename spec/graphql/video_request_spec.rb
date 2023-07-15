require 'rails_helper'

RSpec.describe 'videos request' do
  before(:each) do
    @video1 = Video.create!(
      vimeo_id: 844630998,
      title: 'Learn to Meditate Part 1',
      speaker: 'Daniel Hessey', 
      topic: 'Meditation Instruction',
      length: '00:07:18',
      date_recorded: '2017-18-23',
      video_url: 'https://vimeo.com/844630998?share=copy',
      thumbnail_url: 'https://i.vimeocdn.com/filter/overlay?src0=https%3A%2F%2Fi.vimeocdn.com%2Fvideo%2F1696856869-4797362b715fc28425b1b8c2b1baf5f1aa9db39ef3bd3567572574c18d05c9d0-d_640x360&src1=http%3A%2F%2Ff.vimeocdn.com%2Fp%2Fimages%2Fcrawler_play.png',
      embed_code: '<iframe src="https://player.vimeo.com/video/844630998?h=d3a096a900" width="640" height="564" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>'
    )
    @video2 = Video.create!(
      vimeo_id: 844631799,
      title: 'Learn to Meditate Part 2',
      speaker: 'Daniel Hessey',
      topic: 'Meditation Instruction',
      length: '00:08:20',
      date_recorded: '2017-18-23',
      video_url: 'https://vimeo.com/844631799?share=copy',
      thumbnail_url: 'https://i.vimeocdn.com/filter/overlay?src0=https%3A%2F%2Fi.vimeocdn.com%2Fvideo%2F1696834725-5ae807df9690d5c9d852add5243e303653f4845bead0f63540a10796e98131da-d_640x360&src1=http%3A%2F%2Ff.vimeocdn.com%2Fp%2Fimages%2Fcrawler_play.png',
      embed_code: '<iframe src="https://player.vimeo.com/video/844631799?h=8a3b584b93" width="640" height="564" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>'
    )
  end

  describe 'all_videos' do
    it 'retrieves all videos' do
      query = <<~GQL
        query {
          allVideos {
            title
            speaker
            topic
            length
            dateRecorded
            videoUrl
            embedCode
          }
        }
      GQL

      result = DmcBackEndSchema.execute(query)

      expect(result.dig("data", "allVideos").length).to eq(2)
      result.dig("data", "allVideos").each do |video|
        expect(video).to have_key("title")
        expect(video["title"]).to be_a(String)

        expect(video).to have_key("speaker")
        expect(video["speaker"]).to be_a(String)

        expect(video).to have_key("topic")
        expect(video["topic"]).to be_a(String)

        expect(video).to have_key("length")
        expect(video["length"]).to be_a(String)

        expect(video).to have_key("dateRecorded")
        expect(video["dateRecorded"]).to be_a(String)

        expect(video).to have_key("videoUrl")
        expect(video["videoUrl"]).to be_a(String)

        expect(video).to have_key("embedCode")
        expect(video["embedCode"]).to be_a(String)
      end
    end
  end

  describe 'videoById' do
    it 'retrieves a video by id' do
      query = <<~GQL
        query {
          videoById(id: #{@video1.id}) {
            id 
            title
            speaker
            topic
            length
            dateRecorded
            videoUrl
            embedCode
          }
        }
      GQL

      result = DmcBackEndSchema.execute(query)

      expect(result.dig("data", "videoById")).to have_key("id")
      expect(result.dig("data", "videoById", "id")).to eq(@video1.id.to_s)

      expect(result.dig("data", "videoById")).to have_key("title")
      expect(result.dig("data", "videoById", "title")).to eq(@video1.title)

      expect(result.dig("data", "videoById")).to have_key("speaker")
      expect(result.dig("data", "videoById", "speaker")).to eq(@video1.speaker)

      expect(result.dig("data", "videoById")).to have_key("topic")
      expect(result.dig("data", "videoById", "topic")).to eq(@video1.topic)

      expect(result.dig("data", "videoById")).to have_key("length")
      expect(result.dig("data", "videoById", "length")).to eq(@video1.length)

      expect(result.dig("data", "videoById")).to have_key("dateRecorded")
      expect(result.dig("data", "videoById", "dateRecorded")).to eq(@video1.date_recorded)

      expect(result.dig("data", "videoById")).to have_key("videoUrl")
      expect(result.dig("data", "videoById", "videoUrl")).to eq(@video1.video_url)

      expect(result.dig("data", "videoById")).to have_key("embedCode")
      expect(result.dig("data", "videoById", "embedCode")).to eq(@video1.embed_code)
    end
  end
end