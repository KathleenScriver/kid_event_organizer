require "rails_helper"

describe "Authenticated User" do
  describe "visits kid index page" do
    it 'should show all kids' do
      kid_1 = Kid.create(name: "Eli")
      kid_2 = Kid.create(name: "Caleb")
      kid_3 = Kid.create(name: "Nolan")

      visit kids_path

      expect(page).to have_content(kid_1.name)
      expect(page).to have_content(kid_2.name)
      expect(page).to have_content(kid_3.name)

      click_on(kid_1.name)
      expect(current_path).to eq(kid_path(kid_1))
      expect(page).to have_content(kid_1.name)

      visit kids_path
      click_on(kid_2.name)
      expect(current_path).to eq(kid_path(kid_2))
      expect(page).to have_content(kid_2.name)
    end
  end
end
