FactoryBot.define do
  factory(:organization)

  factory :user do
    password { "password" }
  end

  factory(:ticket) do
  end

  factory :resource_category do
  end

  factory :region do
  end
end