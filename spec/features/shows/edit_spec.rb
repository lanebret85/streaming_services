require "rails_helper"

RSpec.describe "the Show Edit" do
  desribe "As a visitor" do
    describe "When I visit a Shows Show page" do
      it "links to the edit page to update the Show" do
        netflix = StreamingService.create!(name: "Netflix", subscribed: true, logged_in: true, rating: 42)
        the_witcher = netflix.shows.create!(name: "The Witcher", genre: "Fantasy", released: true, episodes: 24, seasons: 3, episode_runtime: 60)

        visit "/shows/#{the_witcher.id}"

        click_button "Update #{the_witcher.name}"

        expect(current_path).to eq("/shows/#{the_witcher.id}/edit")
      end
    end

    describe "When I click the link 'Update Show'" do
      it "takes me to the '/shows/:id/edit' page where I see a form to edit the Shows attributes" do
        netflix = StreamingService.create!(name: "Netflix", subscribed: true, logged_in: true, rating: 42)
        the_witcher = netflix.shows.create!(name: "The Witcher", genre: "Fantasy", released: true, episodes: 24, seasons: 3, episode_runtime: 59)

        visit "/shows/#{the_witcher.id}"

        expect(page).to have_content("59 Minute Episodes")

        click_button "Update The Witcher"

        fill_in "Name", with: "The Witcher"
        fill_in "Genre", with: "Fantasy"
        fill_in "Released", with: true
        fill_in "Episodes", with: 24
        fill_in "Seasons", with: 3
        fill_in "Episode runtime", with: 60
        click_button "Update Show"

        expect(current_path).to eq("/shows/#{the_witcher.id}")
        expect(page).to have_content("60 Minute Episodes")
      end
    end
  end
end