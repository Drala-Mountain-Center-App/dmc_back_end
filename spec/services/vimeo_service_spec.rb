require 'rails_helper'

RSpec.describe VimeoService do
  it 'returns video thumbnails', :vcr do
    service = VimeoService.new
    video_id = "844631799"
    thumbnails = service.get_video_thumbnail(video_id)

    expect(thumbnails).to be_a(Hash)
    expect(thumbnails).to have_key(:data)
    expect(thumbnails[:data]).to be_an(Array)

    expect(thumbnails[:data].first).to have_key(:sizes)
    expect(thumbnails[:data].first[:sizes]).to be_an(Array)

    expect(thumbnails[:data].first[:sizes].first).to have_key(:width)
    expect(thumbnails[:data].first[:sizes].first[:width]).to be_a(Integer)

    expect(thumbnails[:data].first[:sizes].first).to have_key(:height)
    expect(thumbnails[:data].first[:sizes].first[:height]).to be_a(Integer)

    expect(thumbnails[:data].first[:sizes].first).to have_key(:link_with_play_button)
    expect(thumbnails[:data].first[:sizes].first[:link_with_play_button]).to be_a(String)
  end
end