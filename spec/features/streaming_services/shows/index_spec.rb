require "rails_helper"

RSpec.describe "Shows Index", type: :feature do
  before :each do
    @netflix = StreamingService.create!(name: "Netflix", subscribed: true, logged_in: true, rating: 42)
    @hulu = StreamingService.create!(name: "Hulu", subscribed: true, logged_in: true, rating: 39)
    @disney_plus = StreamingService.create!(name: "Disney Plus", subscribed: true, logged_in: false, rating: 35)

    @the_witcher = @netflix.shows.create!(name: "The Witcher", genre: "Fantasy", released: true, episodes: 24, seasons: 3, episode_runtime: 60)
    @is_it_cake = @netflix.shows.create!(name: "Is it Cake?", genre: "Competition", released: true, episodes: 20, seasons: 2, episode_runtime: 60)
    @new_girl = @hulu.shows.create!(name: "New Girl", genre: "Sitcom", released: true, episodes: 146, seasons: 7, episode_runtime: 30)
  end
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes
  # (data from each column that is on the child table)
  describe "As a visitor" do
    describe "When I visit '/streaming_services/:id/shows" do
      it "can display each show with that shows attributes that is associated with the streaming service that matches the id" do
         # arrange
         
         # act
         visit "/streaming_services/#{@netflix.id}/shows"
         # assert
         expect(page).to have_content("Shows Index")
         expect(page).to have_content("Netflix's Shows")
         expect(page).to have_content(@the_witcher.name)
         expect(page).to have_content("Genre: #{@the_witcher.genre}")
         expect(page).to have_content("Released: #{@the_witcher.released}")
         expect(page).to have_content("#{@the_witcher.seasons} Seasons")
         expect(page).to have_content("#{@the_witcher.episodes} Episodes")
         expect(page).to have_content("#{@the_witcher.episode_runtime} Minute Episodes")
         expect(page).to have_content(@is_it_cake.name)
         expect(page).to have_content("Genre: #{@is_it_cake.genre}")
         expect(page).to have_content("Released: #{@is_it_cake.released}")
         expect(page).to have_content("#{@is_it_cake.seasons} Seasons")
         expect(page).to have_content("#{@is_it_cake.episodes} Episodes")
         expect(page).to have_content("#{@is_it_cake.episode_runtime} Minute Episodes")
         expect(page).to have_content("Create Show")
      end

      it "links to the Shows Index page" do
        # arrange
         
        # act
        visit "/streaming_services/#{@netflix.id}/shows"
        # assert
        click_on "Shows Index"

        expect(current_path).to eq("/shows")
      end

      it "links to the Streaming Services Index page" do
        # arrange
        
        # act
        visit "/streaming_services/#{@netflix.id}/shows"
        # assert
        click_on "Streaming Services Index"

        expect(current_path).to eq("/streaming_services")
      end

      it "links to display shows alphabetically by name" do
        visit "/streaming_services/#{@netflix.id}/shows"

        click_on "Sort #{@netflix.name}'s Shows Alphabetically"

        expect(current_path).to eq("/streaming_services/#{@netflix.id}/shows")

        expect(@is_it_cake.name).to appear_before(@the_witcher.name)
      end

      it "has links to update Netflix's shows" do
        visit "/streaming_services/#{@netflix.id}/shows"

        expect(page).to have_content("Update #{@the_witcher.name}")
        expect(page).to have_content("Update #{@is_it_cake.name}")

        click_on "Update #{@the_witcher.name}"

        expect(current_path).to eq("/shows/#{@the_witcher.id}/edit")
      end

      it "has links to update Hulu's shows" do
        visit "/streaming_services/#{@hulu.id}/shows"

        expect(page).to have_content("Update #{@new_girl.name}")

        click_on "Update #{@new_girl.name}"

        expect(current_path).to eq("/shows/#{@new_girl.id}/edit")
      end
    end
  end
end