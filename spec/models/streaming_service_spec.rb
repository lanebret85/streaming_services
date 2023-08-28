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

  describe "class methods" do
    before :each do
      @netflix = StreamingService.create!(name: "Netflix", subscribed: true, logged_in: true, rating: 42)
      @hulu = StreamingService.create!(name: "Hulu", subscribed: true, logged_in: true, rating: 39)
      @disney_plus = StreamingService.create!(name: "Disney Plus", subscribed: true, logged_in: false, rating: 35)

      @the_witcher = @netflix.shows.create!(name: "The Witcher", genre: "Fantasy", released: true, episodes: 24, seasons: 3, episode_runtime: 60)
      @is_it_cake = @netflix.shows.create!(name: "Is It Cake?", genre: "Competition", released: true, episodes: 16, seasons: 2, episode_runtime: 40)
      @new_girl = @hulu.shows.create!(name: "New Girl", genre: "Sitcom", released: true, episodes: 146, seasons: 7, episode_runtime: 30)
    end

    describe "#order_by_time_created" do
    it "can display streaming services in order of most recently created" do
        query = StreamingService.order_by_time_created

        expect(query).to eq([@disney_plus, @hulu, @netflix])
      end
    end

    describe "#count_shows" do
      it "can display the number of shows associated with each streaming service" do
        query = StreamingService.first.count_shows

        expect(query).to eq(2)
      end
    end
  end
end