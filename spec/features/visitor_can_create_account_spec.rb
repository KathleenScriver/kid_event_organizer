require "rails_helper"

describe "As a visitor" do
  describe "when I visit '/' " do
    it 'I should be able to create an account' do
      username = "mommakat"
      title = "Mom"
      name = "Kat"

      visit '/'
      click_link("Create an Account")

      expect(current_path).to eq(new_user_path)
      fill_in :user_name, with: name
      fill_in :user_title, with: title
      fill_in :user_username, with: username
      fill_in :user_password, with: "test"

      click_on("Create User")

      expect(page).to have_content("Welcome, #{name}! (#{title})")
    end
  end
end
