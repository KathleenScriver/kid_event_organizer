FactoryBot.define do
  factory :user do
    name {"SUe Ann"}
    title {"Grandma"}
    username {"gmaSue55"}
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
