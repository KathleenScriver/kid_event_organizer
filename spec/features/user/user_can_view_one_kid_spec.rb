require "rails_helper"

describe "As an authorized user" do
  describe "when I click on a kids name from index" do
    it "should show one kid and their events" do
      user = create(:user)
      kid = create(:kid)
      user.kids << kid
      event_1, event_2 = create_list(:event, 2, kid: kid)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit kids_path
      click_on(kid.name)

      expect(current_path).to eq(kid_path(kid))
      expect(page).to have_content(kid.name)

      within("#event-#{event_1.id}") do
        expect(page).to have_content(event_1.title)
        expect(page).to have_content(event_1.location)
        expect(page).to have_content(event_1.day_of_week)
        expect(page).to have_content(event_1.time.in_time_zone("MST").strftime("%l:%M %P"))
        expect(page).to have_content(event_1.description)
      end
      within("#event-#{event_2.id}") do
        expect(page).to have_content(event_2.title)
        expect(page).to have_content(event_2.location)
        expect(page).to have_content(event_2.day_of_week)
        expect(page).to have_content(event_2.time.in_time_zone("MST").strftime("%l:%M %P"))
        expect(page).to have_content(event_2.description)
      end

      expect(page).to_not have_content("Edit")
      expect(page).to_not have_content("Delete")

      click_link("Back to All Kiddos")
      expect(current_path).to eq(kids_path)
    end
  end
end
