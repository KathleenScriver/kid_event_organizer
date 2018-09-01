require "rails_helper"

describe "As an authenticated user" do
  describe "I can log out" do
    it 'should log user out' do
      user = User.create(name: "Kat", title: "Mom", username: "mommakat", password: "test")

      params(session[:user_id] = user.id)
      visit user_path(user)
      click_on("Log Out")

      expect(current_path).to eq('/')
      expect(page).to have_content("Log In")
      expect(page).to have_content("You have successfully logged out.")
    end
  end
end
