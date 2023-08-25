require "rails_helper"

RSpec.describe "Shows Index", type: :feature do
  before :each do
    @netflix = StreamingService.create!(name: "Netflix", subscribed: true, logged_in: true, rating: 42)
    @hulu = StreamingService.create!(name: "Hulu", subscribed: true, logged_in: true, rating: 39)
    @disney_plus = StreamingService.create!(name: "Disney Plus", subscribed: true, logged_in: false, rating: 35)
  end
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes
  # (data from each column that is on the child table)
  describe "As a visitor" do
    describe "When I visit '/shows'" do
      it "can display all shows in the system with their attributes" do
        # arrange
        the_witcher = @netflix.shows.create!(name: "The Witcher", genre: "Fantasy", released: true, episodes: 24, seasons: 3, episode_runtime: 60)
        is_it_cake = @netflix.shows.create!(name: "Is it Cake?", genre: "Competition", released: true, episodes: 20, seasons: 2, episode_runtime: 60)
        new_girl = @hulu.shows.create!(name: "New Girl", genre: "Sitcom", released: true, episodes: 146, seasons: 7, episode_runtime: 30)
        # act
        visit "/shows"
        # assert
        expect(page).to have_content("All Shows")
        expect(page).to have_content(the_witcher.name)
        expect(page).to have_content("Genre: #{the_witcher.genre}")
        expect(page).to have_content("Released: #{the_witcher.released}")
        expect(page).to have_content("#{the_witcher.seasons} Seasons")
        expect(page).to have_content("#{the_witcher.episodes} Episodes")
        expect(page).to have_content("#{the_witcher.episode_runtime} Minute Episodes")
        expect(page).to have_content("Streaming Service: #{the_witcher.streaming_service_id}")
        expect(page).to have_content(is_it_cake.name)
        expect(page).to have_content("Genre: #{is_it_cake.genre}")
        expect(page).to have_content("Released: #{is_it_cake.released}")
        expect(page).to have_content("#{is_it_cake.seasons} Seasons")
        expect(page).to have_content("#{is_it_cake.episodes} Episodes")
        expect(page).to have_content("#{is_it_cake.episode_runtime} Minute Episodes")
        expect(page).to have_content("Streaming Service: #{is_it_cake.streaming_service_id}")
        expect(page).to have_content(new_girl.name)
        expect(page).to have_content("Genre: #{new_girl.genre}")
        expect(page).to have_content("Released: #{new_girl.released}")
        expect(page).to have_content("#{new_girl.seasons} Seasons")
        expect(page).to have_content("#{new_girl.episodes} Episodes")
        expect(page).to have_content("#{new_girl.episode_runtime} Minute Episodes")
        expect(page).to have_content("Streaming Service: #{new_girl.streaming_service_id}")
      end
    end
  end
end