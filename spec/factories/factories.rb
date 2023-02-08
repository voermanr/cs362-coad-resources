gem 'faker'

FactoryBot.define do

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
    phone {'+1-555-555-5555'}
    region_id { create(:region).id }
    resource_category_id { create(:resource_category).id }
  end

end
