require "rails_helper"

RSpec.describe "the Show creation" do
  describe "As a visitor" do
    describe "When I visit a Streaming Services Shows Index page" do
      it "links to the new page from the streaming services shows index page" do
        netflix = StreamingService.create!(name: "Netflix", subscribed: true, logged_in: true, rating: 42)

        visit "/streaming_services/#{netflix.id}/shows"

        click_button "Create Show"

        expect(current_path).to eq("/streaming_services/#{netflix.id}/shows/new")
      end
    end

    describe "When I click the link 'Create Show'" do
      it "takes me to '/streaming_services/:id/shows/new' where I see a form to add a new show to the streaming service" do
        netflix = StreamingService.create!(name: "Netflix", subscribed: true, logged_in: true, rating: 42)

        visit "/streaming_services/#{streaming_service.id}/shows/new"

        fill_in("Name", with: "Great British Baking Show")
        fill_in("Genre", with: "Competition")
        fill_in("Released", with: true)
        fill_in("Seasons", with: 10)
        fill_in("Episodes", with: 100)
        fill_in("Episode runtime", with: 60)
        click_button "Create Show"

        expect(current_path).to eq("/streaming_services/#{netflix.id}/shows")
        expect(page).to have_content("Great British Baking Show")
        expect(page).to have_content("Genre: Competition")
        expect(page).to have_content("Released: Yes")
        expect(page).to have_content("10 Seasons")
        expect(page).to have_content("100 Episodes")
        expect(page).to have_content("60 Minute Episodes")
      end
    end
  end
end