require "rails_helper"

RSpec.describe "Streaming Services Index", type: :feature do
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  describe "As a visitor" do
    describe "When I visit '/streaming_services'" do
      it "can display the name of each streaming service record in the system" do
        #arrange
        netflix = StreamingService.create!(name: "Netflix", subscribed: true, logged_in: true, rating: 42)
        hulu = StreamingService.create!(name: "Hulu", subscribed: true, logged_in: true, rating: 39)
        disney_plus = StreamingService.create!(name: "Disney Plus", subscribed: true, logged_in: false, rating: 35)
        #act
        visit "/streaming_services"
        #assert
        expect(page).to have_content("All Streaming Services")
        expect(page).to have_content(netflix.name)
        expect(page).to have_content(hulu.name)
        expect(page).to have_content(disney_plus.name)
      end
    end
  end
end