require 'rails_helper'

RSpec.describe CalendarFacade do
  describe 'instance methods' do
    it '#programs', :vcr do
      programs = CalendarFacade.new.programs

      programs.each do |program|
      expect(program).to be_a(Program)
      expect(program).to have_key(:program_name)
      expect(program).to have_key(:program_start_date)
      expect(program).to have_key(:program_end_date)
      expect(program).to have_key(:program_content)
      expect(program).to have_key(:program_image)
      expect(program).to have_key(:program_price)
      expect(program).to have_key(:program_location)
      expect(program).to have_key(:program_address)
      expect(program).to have_key(:program_contact)
      expect(program).to have_key(:program_url)
      expect(program).to have_key(:registration_url)
      expect(program).to have_key(:program_categories)
      expect(program).to have_key(:program_teachers)
      end
    end
  end
end