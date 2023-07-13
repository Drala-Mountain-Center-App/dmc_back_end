class CalendarService

  def get_programs
    get_url("/?json=programs")
  end


  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://www.dralamountain.org') do |f|
    end
  end
end