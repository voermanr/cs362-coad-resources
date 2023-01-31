gem 'faker'

FactoryBot.define do
  factory(:organization) do
    name { Faker::TvShows::TwinPeaks.location }
    phone { Faker::PhoneNumber.cell_phone_with_country_code}
  end

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