require "rails_helper"

describe "As an authenticated admin" do
  describe "when I visit kids show page" do
    it 'should show all events' do
      kid = create(:kid)
      event_1, event_2, event_3 = create_list(:event, 3, kid: kid)
      admin = create(:admin)
      admin.kids << kid
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_kid_path(kid)

      expect(page).to have_content(event_1.title)
      expect(page).to have_content(event_2.title)
      expect(page).to have_content(event_3.title)
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
      time = "5:45 pm"

      expect(current_path).to eq(new_admin_kid_event_path(kid))
      fill_in :event_title, with: new_event_title
      fill_in :event_description, with: descrip
      fill_in :event_location, with: location
      select day, from: :event_day_of_week
      fill_in :event_time, with: time
      click_on("Create Event")

      expect(current_path).to eq(admin_kid_path(kid))
      expect(page).to have_content(kid.name)
      expect(page).to have_content(new_event_title)
      expect(page).to have_content(descrip)
      expect(page).to have_content(location)
      expect(page).to have_content(time)
    end

    it 'should edit and delete events' do
      event = create(:event)
      kid = event.kid
      admin = create(:admin)
      admin.kids << kid
      old_location = event.location
      new_location = "Thornton"
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_kid_path(kid)

      expect(page).to have_content(event.location)
      within("#event-#{event.id}") do
        click_on("Edit")
      end

      expect(current_path).to eq(edit_admin_kid_event_path(kid, event))
      fill_in :event_location, with: new_location
      click_on("Update Event")

      expect(current_path).to eq(admin_kid_path(kid))
      expect(page).to have_content("Location: #{new_location}")
      expect(page).to_not have_content("Location: #{old_location}")

      within("#event-#{event.id}") do
        click_on("Delete")
      end

      expect(page).to_not have_content(event.title)
    end
  end
end
