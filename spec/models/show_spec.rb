require "rails_helper"

RSpec.describe Show, type: :model do
  describe 'relationships' do
    it { should belong_to :streaming_service }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :genre }
    it { should allow_value(true).for(:released)}
    it { should allow_value(false).for(:released)}
    it { should validate_presence_of :episodes }
    it { should validate_presence_of :seasons }
    it { should validate_presence_of :episode_runtime }
  end

  describe "class methods" do
    before :each do
      @netflix = StreamingService.create!(name: "Netflix", subscribed: true, logged_in: true, rating: 42)
      @hulu = StreamingService.create!(name: "Hulu", subscribed: true, logged_in: true, rating: 39)
      @disney_plus = StreamingService.create!(name: "Disney Plus", subscribed: true, logged_in: false, rating: 35)

      @the_witcher = @netflix.shows.create!(name: "The Witcher", genre: "Fantasy", released: true, episodes: 24, seasons: 3, episode_runtime: 60)
      @is_it_cake = @netflix.shows.create!(name: "Is It Cake?", genre: "Competition", released: false, episodes: 16, seasons: 2, episode_runtime: 40)
      @new_girl = @hulu.shows.create!(name: "New Girl", genre: "Sitcom", released: true, episodes: 146, seasons: 7, episode_runtime: 30)
    end

    describe "display_true" do
      it "only displays records where the released column is true" do
        query = Show.where(released: true)

        expect(query).to eq([@the_witcher, @new_girl])
      end
    end
  end
end