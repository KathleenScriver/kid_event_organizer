FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    title {"Grandma"}
    sequence(:username) { |n| "Username#{n}" }
    password {"test"}
    role { 0 }
  end

  factory :admin, class: User do
    name {"Kat"}
    title {"Mom"}
    username {"mommakat11"}
    password {"test"}
    role { 1 }
  end
end
