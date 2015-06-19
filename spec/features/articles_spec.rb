require "rails_spec_helper"

RSpec.feature "articles management" do
  describe "article index" do
    it "lists all articles" do
      Article.create!(title: "Famous Cats")
      Article.create!(title: "Infamous Cats")

      visit articles_path

      expect(page).to have_content("Famous Cats")
      expect(page).to have_content("Infamous Cats")
    end
  end

  describe "article creation" do
    it "accepts user input to create a new article" do
      visit articles_path
      click_on "New Article"
      fill_in "Title", with: "It begins..."
      click_on "Create Article"
      visit articles_path

      expect(page).to have_content("It begins...")
    end
  end
end
