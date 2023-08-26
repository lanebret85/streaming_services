require "rails_helper"

RSpec.describe "Shows Index", type: :feature do
  before :each do
    @netflix = StreamingService.create!(name: "Netflix", subscribed: true, logged_in: true, rating: 42)
    @hulu = StreamingService.create!(name: "Hulu", subscribed: true, logged_in: true, rating: 39)
    @disney_plus = StreamingService.create!(name: "Disney Plus", subscribed: true, logged_in: false, rating: 35)
  end
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes
  # (data from each column that is on the child table)
  describe "As a visitor" do
    describe "When I visit '/streaming_services/:id/shows" do
      it "can display each show with that shows attributes that is associated with the streaming service that matches the id" do
         # arrange
         the_witcher = @netflix.shows.create!(name: "The Witcher", genre: "Fantasy", released: true, episodes: 24, seasons: 3, episode_runtime: 60)
         is_it_cake = @netflix.shows.create!(name: "Is it Cake?", genre: "Competition", released: true, episodes: 20, seasons: 2, episode_runtime: 60)
         # act
         visit "/streaming_services/#{@netflix.id}/shows"
         # assert
         expect(page).to have_content("Shows Index")
         expect(page).to have_content("Netflix's Shows")
         expect(page).to have_content(the_witcher.name)
         expect(page).to have_content("Genre: #{the_witcher.genre}")
         expect(page).to have_content("Released: #{the_witcher.released}")
         expect(page).to have_content("#{the_witcher.seasons} Seasons")
         expect(page).to have_content("#{the_witcher.episodes} Episodes")
         expect(page).to have_content("#{the_witcher.episode_runtime} Minute Episodes")
         expect(page).to have_content(is_it_cake.name)
         expect(page).to have_content("Genre: #{is_it_cake.genre}")
         expect(page).to have_content("Released: #{is_it_cake.released}")
         expect(page).to have_content("#{is_it_cake.seasons} Seasons")
         expect(page).to have_content("#{is_it_cake.episodes} Episodes")
         expect(page).to have_content("#{is_it_cake.episode_runtime} Minute Episodes")
      end

      it "links to the Shows Index page" do
        click_on "Shows Index"

        expect(current_path).to eq("/shows")
      end
    end
  end
end