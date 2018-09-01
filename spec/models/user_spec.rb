require "rails_helper"

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_presence_of(:password)}
  end

  describe 'relationships' do
    it {should have_many(:user_kids)}
    it {should have_many(:kids), through: :user_kids}
  end
end
