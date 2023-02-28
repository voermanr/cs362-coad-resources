FactoryBot.define do
  factory(:organization) do
    name { Faker::TvShows::TwinPeaks.name}
    phone { Faker::PhoneNumber.cell_phone_with_country_code }
    sequence :email do |n|
      "organization#{n}@example.com"
    end
    description { Faker::Lorem.words number: 4 }
    rejection_reason { Faker::Lorem.word }
    created_at { Faker::Date }
    updated_at { Faker::Date }
    primary_name { Faker::TvShows::TwinPeaks.name }
    secondary_name { Faker::TvShows::TwinPeaks.name }
    secondary_phone { Faker::PhoneNumber.cell_phone_with_country_code }
    title {  }
    transportation {  }
  end
end