require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:speaker) }
    it { should validate_presence_of(:topic) }
    it { should validate_presence_of(:length) }
    it { should validate_presence_of(:date_recorded) }
    it { should validate_presence_of(:video_url) }
    it { should validate_presence_of(:img_url) }
  end
end