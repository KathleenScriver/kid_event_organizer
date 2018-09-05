require "rails_helper"

describe "As an admin" do
  describe "when on admin kids show" do
    it "can add a user to view kid" do
      admin = create(:admin)
      kid = create(:kid)
      admin.kids << kid
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_kid_path(kid)

      click_on("Add a User")

      expect(current_path).to eq(new_admin_user_kid_path)
      find('#user_kid_user_id').find(:option, user.name).select_option
      click_on("Link")
      expect(current_path).to eq(admin_kid_path(kid))

      within(".list") do
        expect(page).to have_content(user.name)
      end
    end
  end
end
