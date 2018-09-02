require "rails_helper"

describe "As an unauthenticated user" do
  describe "in order to log in" do
    it "should have login option at root " do
      user = User.create(name: "Kat", title: "Mom", username: "mommakat", password: "test")

      visit root_path
      click_on("Log In")
      expect(current_path).to eq(login_path)
      fill_in :login_username, with: user.username
      fill_in :login_password, with: user.password

      within(".btn") do
        click_on("Log In")
      end

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome, #{user.name}! (#{user.title})")
      expect(page).to have_content("Log Out")
    end
  end
end
