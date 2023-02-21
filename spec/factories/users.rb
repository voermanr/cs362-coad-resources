FactoryBot.define do
  factory :user do
    email
    password { Faker::Internet.password(min_length: 7, max_length: 128) }

    before(:create, &:skip_confirmation!)

    trait :organization_approved do
      role { :organization }
      organization_id { create(:organization, :approved).id }
    end

    trait :organization_unapproved do
      role { :organization }
      organization_id { create(:organization).id }
    end

    trait :admin do
      role { :admin }
    end
  end
end
