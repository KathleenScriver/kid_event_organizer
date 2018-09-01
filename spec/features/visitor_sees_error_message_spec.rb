require "rails_helper"

describe "As a visit" do
  describe "when I visit kids_path" do
    it 'should tell me to log in' do
      kid = create(:kid)
      visit kids_path

      expect(current_path).to eq(login_path)
      expect(page).to have_content("You must be logged in to access this page.")
    end
  end
end
