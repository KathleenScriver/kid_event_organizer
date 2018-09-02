require "rails_helper"

describe "As an authenticated admin" do
  describe "when I visit kids index page" do
    it 'should show create buttons' do
      admin = create(:admin)
      kid_1 = admin.kids.create(name: "Kid 1")
      kid_2 = admin.kids.create(name: "Kid 2")
      kid_3 = admin.kids.create(name: "Kid 3")
      allow_any_instance_of(ApplicationController).to receive(:current_user). and_return(admin)

      visit admin_kids_path

      expect(page).to have_content(kid_1.name)
      expect(page).to have_content(kid_2.name)
      expect(page).to have_content(kid_3.name)
      expect(page).to have_link("Add a Kiddo")
    end
  end
end
