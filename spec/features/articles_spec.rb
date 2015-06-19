require "rails_spec_helper"

RSpec.feature "articles management", js: true do
  describe "article index" do
    it "lists all articles" do
      Article.create!(title: "Famous Cats")
      Article.create!(title: "Infamous Cats")

      visit articles_path

      expect(page).to have_content("Famous Cats")
      expect(page).to have_content("Infamous Cats")
    end
  end
end
