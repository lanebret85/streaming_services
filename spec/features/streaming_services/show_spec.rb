require "rails_helper"

RSpec.describe "Streaming Services Show", type: :feature do
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes
  # (data from each column that is on the parent table)
  describe "As a visitor" do
    describe "When I visit '/streaming_services/:id'" do
      before :each do
        @netflix = StreamingService.create!(name: "Netflix", subscribed: true, logged_in: true, rating: 42)
        @hulu = StreamingService.create!(name: "Hulu", subscribed: true, logged_in: true, rating: 39)
        @disney_plus = StreamingService.create!(name: "Disney Plus", subscribed: true, logged_in: false, rating: 35)

        @the_witcher = @netflix.shows.create!(name: "The Witcher", genre: "Fantasy", released: true, episodes: 24, seasons: 3, episode_runtime: 60)
        @is_it_cake = @netflix.shows.create!(name: "Is It Cake?", genre: "Competition", released: true, episodes: 16, seasons: 2, episode_runtime: 40)
        @new_girl = @hulu.shows.create!(name: "New Girl", genre: "Sitcom", released: true, episodes: 146, seasons: 7, episode_runtime: 30)
      end

      it "can display the streaming service that matches that id and its attributes including the number of shows that belong to it" do
        #arrange
        
        #act
        visit "/streaming_services/#{@netflix.id}"
        #assert
        expect(page).to have_content("Shows Index")
        expect(page).to have_content(@netflix.name)
        expect(page).to have_content("Subscribed: Yes")
        expect(page).to have_content("Logged in: Yes")
        expect(page).to have_content("Rating: #{@netflix.rating}")
        expect(page).to have_content("Library: #{@netflix.shows.count} Shows")
        expect(page).to_not have_content(@hulu.name)
        expect(page).to_not have_content(@hulu.subscribed)
        expect(page).to_not have_content(@hulu.logged_in)
        expect(page).to_not have_content(@hulu.rating)
        expect(page).to_not have_content(@disney_plus.name)
        expect(page).to_not have_content(@disney_plus.subscribed)
        expect(page).to_not have_content(@disney_plus.logged_in)
        expect(page).to_not have_content(@disney_plus.rating)
      end

      it "links to the Shows Index page" do
        #arrange
        
        #act
        visit "/streaming_services/#{@netflix.id}"
        #assert
        click_on "Shows Index"

        expect(current_path).to eq("/shows")
      end
    end
  end
end