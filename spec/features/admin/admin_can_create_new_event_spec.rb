require "rails_helper"

describe "As an authenticated admin" do
  describe "when I visit kids show page" do
    it 'should show all events' do
      event_1, event_2, event_3 = create_list(:event, 3)
      admin = create(:admin)
      kid = create(:kid)
      admin.kids << kid
      kid.events << event_1
      kid.events << event_2
      kid.events << event_3
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_kid_path(kid)

      expect(page).to have_content(event_1.title)
      # expect(page).to have_content(event_2.title)
      # expect(page).to have_content(event_3.title)
      expect(page).to have_link("Edit")
      expect(page).to have_link("Delete")
      expect(page).to have_link("Add New Event")
    end

    it 'should be able to add new event' do
      kid = create(:kid)
      admin = create(:admin)
      admin.kids << kid

      allow_any_instance_of(ApplicationController).to receive(:current_user). and_return(admin)

      visit admin_kid_path(kid)

      click_on("Add New Event")

      new_event_title = "Soccer"
      descrip = "Play Soccer"
      location = "Westminster Rec Center"
      day = "Monday"
      time = "9:15 am"

      expect(current_path).to eq(new_admin_kid_event_path(kid))
      fill_in :event_title, with: new_event_title
      fill_in :event_description, with: descrip
      fill_in :event_location, with: location
      fill_in :event_day_of_week, with: day

      fill_in :time, with: time
      click_on("Create Event")

      expect(current_path).to eq(admin_kid_path(kid))
      expect(page).to have_content(kid.name)
      expect(page).to have_content(new_event_title)
      expect(page).to have_content(descrip)
      expect(page).to have_content(location)
      expect(page).to have_content(time)
    end
  end
end
