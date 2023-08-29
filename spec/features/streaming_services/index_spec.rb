require "rails_helper"

RSpec.describe "Streaming Services Index", type: :feature do
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  describe "As a visitor" do
    describe "When I visit '/streaming_services'" do
      before :each do
        @netflix = StreamingService.create!(name: "Netflix", subscribed: true, logged_in: true, rating: 42)
        @hulu = StreamingService.create!(name: "Hulu", subscribed: true, logged_in: true, rating: 39)
        @disney_plus = StreamingService.create!(name: "Disney Plus", subscribed: true, logged_in: false, rating: 35)
      end

      it "can display the name of each streaming_service in order of most recently created" do
        #arrange

        #act
        visit "/streaming_services"
        #assert
        expect(page).to have_content("Shows Index")
        expect(page).to have_content("All Streaming Services")
        expect(page).to have_content("#{@netflix.name}, Created at: #{@netflix.created_at}")
        expect(page).to have_content("#{@hulu.name}, Created at: #{@hulu.created_at}")
        expect(page).to have_content("#{@disney_plus.name}, Created at: #{@disney_plus.created_at}")
        expect(page).to have_content("New Streaming Service")
      end

      it "links to the Shows Index page" do
        # arrange
        
        # act
        visit "/streaming_services"
        # assert
        click_on "Shows Index"

        expect(current_path).to eq("/shows")
      end

      it "links to the Streaming Services Index page" do
        # arrange
        
        # act
        visit "/streaming_services"
        # assert
        click_on "Streaming Services Index"

        expect(current_path).to eq("/streaming_services")
      end

      it "has links to update each streaming service" do
        visit "/streaming_services"

        expect(page).to have_content("Update #{@netflix.name}")
        expect(page).to have_content("Update #{@hulu.name}")
        expect(page).to have_content("Update #{@disney_plus.name}")

        click_on "Update #{@netflix.name}"

        expect(current_path).to eq("/streaming_services/#{@netflix.id}/edit")
      end

      it "has links to delete each streaming service" do
        visit "/streaming_services"
        
        expect(page).to have_content("Delete #{@netflix.name}")
        expect(page).to have_content("Delete #{@hulu.name}")
        expect(page).to have_content("Delete #{@disney_plus.name}")

        click_on "Delete #{@disney_plus.name}"

        expect(current_path).to eq("/streaming_services")
        expect(page).to_not have_content("#{@disney_plus.name}")
      end

      it "displays the name of each streaming service with a link to the show page for that streaming service" do
        visit "/streaming_services"

        click_on "#{@netflix.name}"

        expect(current_path).to eq("/streaming_services/#{@netflix.id}")
      end
    end
  end
end