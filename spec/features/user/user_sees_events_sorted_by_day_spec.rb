require "rails_helper"

describe "As an authorized user" do
  describe "when I visit the kids index page" do
    it 'should have a link to sort events by the day' do
      user = create(:user)
      kid_1 = create(:kid)
      kid_2 = create(:kid)
      kid_3 = create(:kid)
      user.kids << kid_1
      user.kids << kid_2
      user.kids << kid_3
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

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit kids_path
      click_on("Week View")

      within("#Tuesday") do
        expect(page).to have_content(event_1.title)
        expect(page).to have_content(event_5.title)
      end

      within("#Saturday") do
        expect(page).to have_content(event_4.title)
        expect(page).to have_content(event_8.title)
      end
    end
  end
end
