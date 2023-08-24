require "rails_helper"

RSpec.describe StreamingService, type: :model do
  describe 'relationships' do
    it { should have_many :shows }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should allow_value(true).for(:subscribed)}
    it { should allow_value(false).for(:subscribed)}
    it { should allow_value(true).for(:logged_in)}
    it { should allow_value(false).for(:logged_in)}
    it { should validate_presence_of :rating }
  end
end