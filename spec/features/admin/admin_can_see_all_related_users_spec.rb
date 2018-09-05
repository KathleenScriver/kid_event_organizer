require "rails_helper"

describe "As an admin" do
  describe "when on kids show" do
    it "should show all users and admin who can see that kid" do
      kid = create(:kid)
      user_1, user_2 = create_list(:user, 2)
      admin = create(:admin)
      user_1.kids << kid
      user_2.kids << kid
      admin.kids << kid

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_kid_path(kid)

      expect(page).to have_content(user_1.name)
      expect(page).to have_content(user_2.name)
      expect(page).to have_content(admin.name)
    end

    it "should be able to delete user from viewing that kid" do
      kid = create(:kid)
      user_1, user_2 = create_list(:user, 2)
      admin = create(:admin)
      user_1.kids << kid
      user_2.kids << kid
      admin.kids << kid

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_kid_path(kid)

      within("#user-#{user_1.id}") do
        click_on("Remove User")
      end

      expect(page).to_not have_content(user_1.name)
      expect(page).to have_content(user_2.name)
    end
  end
end
