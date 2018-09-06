require "rails_helper"

describe "As an authorized user" do
  describe "when I visit the kids index page" do
    it 'should have a link to sort events by the day' do
      user_1, user_2 = create_list(:user, 2)
      kid_1 = create(:kid)
      kid_2 = create(:kid)
      kid_3 = create(:kid)
      kid_4 = create(:kid)
      user_1.kids << kid_1
      user_1.kids << kid_2
      user_1.kids << kid_3
      user_2.kids << kid_4
      event_1 = create(:event, kid: kid_1)
      event_2 = create(:event, kid: kid_1, title: "Soccer", day_of_week: "Tuesday")
      event_3 = create(:event, kid: kid_1, title: "Swimming", day_of_week: "Sunday")
      event_4 = create(:event, kid: kid_1, title: "Gym Class", day_of_week: "Saturday")
      event_5 = create(:event, kid: kid_2, title: "Soccer", day_of_week: "Tuesday")
      event_6 = create(:event, kid: kid_2, title: "Swimming", day_of_week: "Wednesday")
      event_7 = create(:event, kid: kid_2, title: "Date with Grandma", day_of_week: "Friday")
      event_8 = create(:event, kid: kid_3, title: "Soccer", day_of_week: "Saturday")
      event_9 = create(:event, kid: kid_3, title: "Swimming", day_of_week: "Sunday")
      event_10 = create(:event, kid: kid_3, title: "Toddler Class", day_of_week: "Thursday")
      event_11 = create(:event, kid: kid_4, title: "Basketball", day_of_week: "Friday")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      visit kids_path
      click_on("Week View")

      expect(current_path).to eq(events_path)

      expect(page).to_not have_content(event_11.title)

      within("#Tuesday") do
        expect(page).to have_content(event_2.title)
        expect(page).to have_content(event_5.title)
      end

      within("#Saturday") do
        expect(page).to have_content(event_4.title)
        expect(page).to have_content(event_8.title)
      end

      click_on("Kid View")
      expect(current_path).to eq(kids_path)
    end
  end
end
