require "rails_helper"

describe Kid, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
  end

  describe "relationships" do
    it {should have_many(:user_kids)}
    it {should have_many(:users), through: :user_kids}
  end
end
