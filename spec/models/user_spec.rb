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

  describe "roles" do
    it "can be an admin" do
      user = create(:admin)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it "can create user as default" do
      user = create(:user)

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end
  end

  describe 'instance methods' do
    it '.event_scope' do
      user = create(:user)
      kid_1, kid_2 = create_list(:kid, 2)
      user.kids << kid_1
      user.kids << kid_2

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      expect(user.event_scope).to eq([kid_1.id, kid_2.id])
    end
  end
end
