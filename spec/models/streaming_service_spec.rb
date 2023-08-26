require "rails_helper"

RSpec.describe StreamingService, type: :model do
  before :each do
    @netflix = StreamingService.create!(name: "Netflix", subscribed: true, logged_in: true, rating: 42)
    @hulu = StreamingService.create!(name: "Hulu", subscribed: true, logged_in: true, rating: 39)
    @disney_plus = StreamingService.create!(name: "Disney Plus", subscribed: true, logged_in: false, rating: 35)
  end
  
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

  describe "#order_by_time_created" do
    it "can display streaming services in order of most recently created" do
      query = StreamingService.order(created_at: :desc)

      expect(query).to eq([@disney_plus, @hulu, @netflix])
    end
  end
end