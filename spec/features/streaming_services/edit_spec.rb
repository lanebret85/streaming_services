require "rails_helper"

RSpec.describe "the Streaming Service Update" do
  describe "As a visitor" do
    describe "When I visit a parent show page" do
      it "has a link to update the streaming service 'Update Streaming Service'" do
        netflix = StreamingService.create!(name: "Netflix", subscribed: true, logged_in: true, rating: 42)
        
        visit "/streaming_services/#{netflix.id}"
        
        click_button "Update #{netflix.name}"
        
        expect(current_path).to eq("/streaming_services/#{netflix.id}/edit")
      end
    end
    
    describe "When I click the link 'Update Streaming Service'" do
      it "takes me to the '/streaming_services/:id/edit' where I see a form to edit the Streaming Service's attributes" do
        netflix = StreamingService.create!(name: "Netflix", subscribed: true, logged_in: true, rating: 42)
        
        visit "/streaming_services/#{netflix.id}"

        expect(page).to have_content("Rating: 42")

        click_button "Update Netflix"

        fill_in "Name", with: "Netflix"
        fill_in "Subscribed", with: true
        fill_in "Logged in", with: true
        fill_in "Rating", with: 43
        click_button "Update Streaming Service"

        expect(current_path).to eq("/streaming_services/#{netflix.id}")
        expect(page).to have_content("Rating: 43")
      end
    end
  end
end