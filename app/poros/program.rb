class Program
  attr_reader :name,
              :start_date,
              :end_date,
              :content,
              :image,
              :price,
              :url,
              :registration_url,
              :categories,
              :teachers

  def initialize(data)
    @name = data[:program_name]    
    @start_date = data[:program_start_date]    
    @end_date = data[:program_end_date]    
    @content = data[:program_content]    
    @image = data[:program_image]    
    @price = data[:program_price]    
    @url = data[:program_url]    
    @registration_url = data[:registration_url]    
    @categories = data[:program_categories]    
    @teachers = data[:program_teachers]    
  end
end
