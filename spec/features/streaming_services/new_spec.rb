require "rails_helper"

RSpec.describe "the Streaming Service Creation" do
  describe "As a visitor" do
    describe "When I visit the Streaming Service Index page" do
      it "links to the new page from the Streaming Services Index page" do
        visit "/streaming_services"
        
        click_link("New Streaming Service")

        expect(current_path).to eq("/streaming_services/new")
      end
    end

    describe "When I click this link" do
      it "takes me to the New Streaming Services page where I see a form for a new Streaming Service record" do
        visit "/streaming_services/new"

        fill_in("Name", with: "Apple TV Plus")
        fill_in("Subscribed", with: true)
        fill_in("Logged in", with: true)
        fill_in("Rating", with: 40)
        click_button("Create Streaming Service")

        expect(current_path).to eq("/streaming_services")
        expect(page).to have_content("Apple TV Plus")
      end
    end
  end
end