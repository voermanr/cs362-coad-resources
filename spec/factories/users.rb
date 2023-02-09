FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    encrypted_password { Faker::Internet.password(min_length: 7, max_length: 255) }
  end
end
