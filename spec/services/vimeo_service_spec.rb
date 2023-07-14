require 'rails_helper'

RSpec.describe VimeoService do
  it 'returns video details', :vcr do
    service = VimeoService.new
    vimeo_id = 844631799
    video = service.get_video(vimeo_id)

    expect(video).to be_a(Hash)

    expect(video).to have_key(:name)
    expect(video[:name]).to be_a(String)

    expect(video).to have_key(:description)
    expect(video[:description]).to be_a(String).or eq(nil)

    expect(video).to have_key(:link)
    expect(video[:link]).to be_a(String)

    expect(video).to have_key(:duration)
    expect(video[:duration]).to be_a(Integer)

    expect(video).to have_key(:embed)
    expect(video[:embed]).to be_a(Hash)

    expect(video[:embed]).to have_key(:html)
    expect(video[:embed][:html]).to be_a(String)

    expect(video).to have_key(:pictures)
    expect(video[:pictures]).to be_a(Hash)

    expect(video[:pictures]).to have_key(:sizes)
    expect(video[:pictures][:sizes]).to be_a(Array)

    expect(video[:pictures][:sizes][3]).to have_key(:link_with_play_button)
    expect(video[:pictures][:sizes][3][:link_with_play_button]).to be_a(String)

    expect(video[:pictures][:sizes][3]).to have_key(:width)
    expect(video[:pictures][:sizes][3][:width]).to eq(640)

    expect(video[:pictures][:sizes][3]).to have_key(:height)
    expect(video[:pictures][:sizes][3][:height]).to eq(360)
  end
end