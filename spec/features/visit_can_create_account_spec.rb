require "rails_helper"

describe "As a visitor" do
  describe "when I visit '/' " do
    it 'I should be able to create an account' do
      username = "mommakat"
      visit '/'
      click_link("Create an Account")

      expect(current_path).to eq(new_user_path)
      fill_in :user_usernmae, with: username
      fill_in :user_password, with: "test"

      click_on("Create User")

      expect(page).to have_content("Welcome, #{username}!")
    end
  end
end
