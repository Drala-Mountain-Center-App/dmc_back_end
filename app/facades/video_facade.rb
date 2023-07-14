class VideoFacade
  def initialize(video_id)
    @video_id = video_id
  end

  def video_name
    video_data
  end

  private

  def service
    @_service ||= VimeoService.new
  end

  def video_data
    @_video_data ||= service.get_video(@vimeo_id)
  end
end