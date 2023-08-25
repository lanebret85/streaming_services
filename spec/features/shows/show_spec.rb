require "rails_helper"

RSpec.describe "Shows Index", type: :feature do
  before :each do
    @netflix = StreamingService.create!(name: "Netflix", subscribed: true, logged_in: true, rating: 42)
    @hulu = StreamingService.create!(name: "Hulu", subscribed: true, logged_in: true, rating: 39)
    @disney_plus = StreamingService.create!(name: "Disney Plus", subscribed: true, logged_in: false, rating: 35)
  end
  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes
  # (data from each column that is on the child table)
  describe "As a visitor" do
    describe "When I visit '/shows/:id'" do
      it "can display the show with that id including the show's attributes" do
        # arrange
        the_witcher = @netflix.shows.create!(name: "The Witcher", genre: "Fantasy", released: true, episodes: 24, seasons: 3, episode_runtime: 60)
        is_it_cake = @netflix.shows.create!(name: "Is it Cake?", genre: "Competition", released: true, episodes: 20, seasons: 2, episode_runtime: 60)
        new_girl = @hulu.shows.create!(name: "New Girl", genre: "Sitcom", released: true, episodes: 146, seasons: 7, episode_runtime: 30)
        # act
        visit "/shows/#{the_witcher.id}"
        # assert
        expect(page).to have_content(the_witcher.name)
        expect(page).to have_content("Genre: #{the_witcher.genre}")
        expect(page).to have_content("Released: Yes")
        expect(page).to have_content("#{the_witcher.seasons} Seasons")
        expect(page).to have_content("#{the_witcher.episodes} Episodes")
        expect(page).to have_content("#{the_witcher.episode_runtime} Minute Episodes")
        expect(page).to have_content("Available on: Netflix")
      end
    end
  end
end