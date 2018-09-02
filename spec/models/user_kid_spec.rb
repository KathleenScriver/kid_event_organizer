require "rails_helper"

describe UserKid, type: :model do
  describe "relationships" do
    it {should belong_to(:kid)}
    it {should belong_to(:user)}
  end
end
