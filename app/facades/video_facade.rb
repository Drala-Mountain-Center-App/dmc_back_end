class VideoFacade
  def initialize(vimeo_id)
    @vimeo_id = vimeo_id
  end

  def title
    video_data[:name]
  end

  def description
    video_data[:description]
  end

  def length
    Time.at(video_data[:duration]).utc.strftime("%H:%M:%S")
  end

  def video_url
    video_data[:link]
  end

  def thumbnail_url
    video_data[:pictures][:sizes][3][:link_with_play_button]
  end

  def embed_code
    video_data[:embed][:html]
  end

  private

  def service
    @_service ||= VimeoService.new
  end

  def video_data
    @_video_data ||= service.get_video(@vimeo_id)
  end
end