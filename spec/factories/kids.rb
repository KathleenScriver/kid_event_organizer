FactoryBot.define do
  factory :kid do
    sequence(:name) { |n| "Kid #{n}"}
    user
  end
end
