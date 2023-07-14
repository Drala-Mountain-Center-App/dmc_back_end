class VimeoService
  def get_video(vimeo_id)
    get_url("/videos/#{vimeo_id}")
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.vimeo.com') do |f|
      f.headers['Authorization'] = "Bearer #{ENV['VIMEO_TOKEN']}"
      f.adapter Faraday.default_adapter
    end
  end
end