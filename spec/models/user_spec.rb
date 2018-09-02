require "rails_helper"

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_presence_of(:password)}

    it "should have unique username" do
      first = User.create(name: "kat", title: "mom", username: "kat123", password: "test")
      second = User.create(name: "kat", title: "mom", username: "kat123", password: "test")

      expect(second).to_not be_valid
    end
  end

  describe 'relationships' do
    it {should have_many(:user_kids)}
    it {should have_many(:kids), through: :user_kids}
  end
end
