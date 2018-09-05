require "rails_helper"

describe "As an authenticated admin" do
  describe "when I visit kids index page" do
    it 'should show create buttons' do
      admin = create(:admin)
      kid_1 = admin.kids.create(name: "Kid 1")
      kid_2 = admin.kids.create(name: "Kid 2")
      event_1, event_2 = create_list(:event, 2)
      kid_1.events << event_1
      kid_2.events << event_2

      allow_any_instance_of(ApplicationController).to receive(:current_user). and_return(admin)

      visit kids_path

      within("#kid-#{kid_1.id}") do
        expect(page).to have_content(kid_1.name)
        expect(page).to have_content(event_1.title)
        expect(page).to have_content(event_1.day_of_week)
      end

      within("#kid-#{kid_2.id}") do
        expect(page).to have_content(kid_2.name)
        expect(page).to have_content(event_2.title)
        expect(page).to have_content(event_2.day_of_week)
      end
      expect(page).to have_link("Add a Kiddo")
    end
  end

  describe "as a deafult user" do
    it 'should not allow access to admin page' do
      user = create(:user)
      kid = create(:kid)
      user.kids << kid

      visit admin_kid_path(kid)

      expect(page).to_not have_content(kid.name)
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
