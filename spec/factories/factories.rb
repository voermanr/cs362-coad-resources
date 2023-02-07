gem 'faker'

FactoryBot.define do

  factory :user do
    password { "password" }
  end

  factory :resource_category do
    name {'test resource_category'}
    active {true}
  end

  factory :region do
    name {"Fake Region"}
  end

  factory :ticket do
    name {'test ticket'}
    description {'fake ticket'}
    phone {'+15555555555'}
    region_id { create(:region).id }
    resource_category_id { create(:resource_category).id }
  end

end
