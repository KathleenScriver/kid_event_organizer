require "rails_helper"

describe "As an admin" do
  describe "when I am on the kids index page" do
    describe "when I click on that kids name" do
      it "should take me to show where I can edit" do
        admin = create(:admin)
        old_name = "Kid 1"
        kid_1 = admin.kids.create(name: old_name)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_kids_path
        click_on(kid_1.name)

        expect(current_path).to eq(admin_kid_path(kid_1))
        click_on("Edit")

        new_name = "New Name"
        expect(current_path).to eq(edit_admin_kid_path(kid_1))
        fill_in :admin_kid_name, with: new_name
        click_on("Update")

        expect(current_path).to eq(admin_kid_path(kid_1))
        expect(page).to have_content(new_name)
        expect(page).to_not have_content(old_name)
      end

    end
  end
end
