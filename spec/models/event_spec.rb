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

  describe 'class methods' do
    it ".sorted_days" do
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
      event_7 = create(:event, kid: kid_2, title: "Date with Grandma", day_of_week: "Saturday")
      event_8 = create(:event, kid: kid_3, title: "Soccer", day_of_week: "Saturday")
      event_9 = create(:event, kid: kid_3, title: "Swimming", day_of_week: "Sunday")
      event_10 = create(:event, kid: kid_3, title: "Toddler Class", day_of_week: "Thursday")

      sorted_array= [[event_1],
                    [event_2, event_5],
                    [event_6],
                     [event_10],
                     [],
                     [event_4, event_7, event_8],
                     [event_3, event_9]]

      expect(Event.sorted_days).to eq(sorted_array)
    end
  end
end
