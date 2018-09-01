require "rails_helper"

describe "As an unauthenticated user" do
  describe "in order to log in" do
    it "should have login option at '/' " do
      user = User.create(name: "Kat", title: "Mom", username: "mommakat", password: "test")

      visit '/'
      click_on("Log In")

      expect(current_path).to eq(login_path)
      fill_in "username", with: user.username
      fill_in "password", with: user.password

      click_on("Log In")

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome, #{user.name}! (#{user.title})")
      expect(page).to have_content("Log Out")
    end
  end
end
