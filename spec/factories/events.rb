FactoryBot.define do
  factory :event do
    sequence(:title) { |n| "Event #{n}"}
    location "Westminster"
    day_of_week "Monday"
    time "9:00 AM"
    description "Team Mustangs"
    kid
  end
end
