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
end
