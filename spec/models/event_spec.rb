require "rails_helper"

describe Event, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:location)}
    it {should validate_presence_of(:day_of_week)}
    it {should validate_presence_of(:time)}
  end

  describe "relationships" do
    it {should belong_to(:kid)}
  end

  describe "class methods" do
    it ".sorted_events" do
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
      event_7 = create(:event, kid: kid_2, title: "Date with Grandma", day_of_week: "Saturday")
      event_8 = create(:event, kid: kid_3, title: "Soccer", day_of_week: "Saturday")
      event_9 = create(:event, kid: kid_3, title: "Swimming", day_of_week: "Sunday")
      event_10 = create(:event, kid: kid_3, title: "Toddler Class", day_of_week: "Thursday")

      event_11 = create(:event, kid: kid_4, title: "Basketball", day_of_week: "Friday")

      scope_1 = user_1.kids.pluck(:id)
      scope_2 = user_2.kids.pluck(:id)

      sorted_1 = [[event_1],
                        [event_2, event_5],
                        [event_6],
                         [event_10],
                         [],
                         [event_4, event_7, event_8],
                         [event_3, event_9]]

      sorted_2 = [[],[],[],[],[event_11],[], []]

      expect(Event.sorted_events(scope_1)).to eq(sorted_1)
      expect(Event.sorted_events(scope_2)).to eq(sorted_2)
    end
  end
end
