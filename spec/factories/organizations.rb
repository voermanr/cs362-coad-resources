FactoryBot.define do
  factory(:organization) do
    name { Faker::Name.name}
    phone { Faker::PhoneNumber.cell_phone_with_country_code }
    email
    description { Faker::Lorem.words number: 4 }
    rejection_reason { Faker::Lorem.word }
    created_at { Faker::Date }
    updated_at { Faker::Date }
    primary_name { Faker::Name.name }
    secondary_name { Faker::Name.name }
    secondary_phone { Faker::PhoneNumber.cell_phone_with_country_code }
    title {  }
    transportation {  }

    trait :approved do
      status { :approved }
    end
  end
end