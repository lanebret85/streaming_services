require "rails_helper"

RSpec.describe "Shows Index" type: :feature do
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes
  # (data from each column that is on the child table)
  describe "As a visitor" do
    describe "When I visit '/shows'" do
      it "can display all shows in the system with their attributes" do
        # arrange
        the_witcher = Show.create!(name: "The Witcher", genre: "Fantasy", released: true, episodes: 24, seasons: 3, episode_runtime: 60, streaming_service_id: 1)
        is_it_cake = Show.create!(name: "Is it Cake?", genre: "Competition", released: true, episodes: 20, seasons: 2, episode_runtime: 60, streaming_service_id: 1)
        new_girl = Show.create!(name: "New Girl", genre: "Sitcom", released: true, episodes: 146, seasons: 7, episode_runtime: 30, streaming_service_id: 2)
        # act
        visit "/shows"
        # assert
        expect(page).to have_content("All Shows")
        expect(page).to have_content(the_witcher.name)
        expect(page).to have_content("Genre: #{the_witcher.genre}")
        expect(page).to have_content("Released: Yes")
        expect(page).to have_content("Episodes: #{the_witcher.episodes}")
        expect(page).to have_content("Seasons: #{the_witcher.seasons}")
        expect(page).to have_content("Episode Runtime: #{the_witcher.episode_runtime}")
        expect(page).to have_content("Streaming Service: Netflix")
        expect(page).to have_content(is_it_cake.name)
        expect(page).to have_content("Genre: #{is_it_cake.genre}")
        expect(page).to have_content("Released: Yes")
        expect(page).to have_content("Episodes: #{is_it_cake.episodes}")
        expect(page).to have_content("Seasons: #{is_it_cake.seasons}")
        expect(page).to have_content("Episode Runtime: #{is_it_cake.episode_runtime}")
        expect(page).to have_content("Streaming Service: Netflix")
        expect(page).to have_content(new_girl.name)
        expect(page).to have_content("Genre: #{new_girl.genre}")
        expect(page).to have_content("Released: Yes")
        expect(page).to have_content("Episodes: #{new_girl.episodes}")
        expect(page).to have_content("Seasons: #{new_girl.seasons}")
        expect(page).to have_content("Episode Runtime: #{new_girl.episode_runtime}")
        expect(page).to have_content("Streaming Service: Hulu")
      end
    end
  end
end