class CalendarFacade

  def programs
    service.get_programs.map do |program_data|
      Program.new(program_data)
    end
  end


  private 

  def service 
    @_service ||= CalendarService.new
  end
end