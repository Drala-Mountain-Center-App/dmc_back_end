require 'rails_helper'

RSpec.describe CalendarService do
  it 'returns program info', :vcr do
    service = CalendarService.new
    programs = service.get_programs

    expect(programs).to be_a(Array)

    programs.each do |program|
      expect(program).to have_key(:program_name)
      expect(program[:program_name]).to be_a(String)

      expect(program).to have_key(:program_start_date)
      expect(program[:program_start_date]).to be_a(String)

      expect(program).to have_key(:program_end_date)
      expect(program[:program_end_date]).to be_a(String)

      expect(program).to have_key(:program_content)
      expect(program[:program_content]).to be_a(String)

      expect(program).to have_key(:program_image)
      expect(program[:program_image]).to be_a(String)

      expect(program).to have_key(:program_price)
      # expect(program[:program_price]).to be_a(String)

      expect(program).to have_key(:program_location)
      # expect(program[:program_location]).to be_a(String)

      expect(program).to have_key(:program_address)
      # expect(program[:program_address]).to be_a(String)

      expect(program).to have_key(:program_contact)
      # expect(program[:program_contact]).to be_a(String)

      expect(program).to have_key(:program_url)
      expect(program[:program_url]).to be_a(String)

      expect(program).to have_key(:registration_url)
      expect(program[:registration_url]).to be_a(String)

      expect(program).to have_key(:program_categories)
      expect(program[:program_categories]).to be_a(Array)

      expect(program).to have_key(:program_teachers)
      expect(program[:program_teachers]).to be_a(Array)
    end
  end
end