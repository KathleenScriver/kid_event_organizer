FactoryBot.define do
  factory :kid do
    sequence(:name) { |n| "Kid #{n}"}
  end
end
