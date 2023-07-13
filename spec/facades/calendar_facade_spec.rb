require 'rails_helper'

RSpec.describe CalendarFacade do
  describe 'instance methods' do
    it '#programs', :vcr do
      programs = CalendarFacade.new.programs

      programs.each do |program|
      expect(program).to be_a(Program)
      expect(program.name).to be_a(String)
      expect(program.start_date).to be_a(String)
      expect(program.end_date).to be_a(String)
      expect(program.content).to be_a(String)
      expect(program.image).to be_a(String)
      expect(program.price).to be_a(String) unless program.price.nil?
      expect(program.url).to be_a(String)
      expect(program.registration_url).to be_a(String)
      expect(program.categories).to be_a(Array)
      expect(program.teachers).to be_a(Array)
      end
    end
  end
end