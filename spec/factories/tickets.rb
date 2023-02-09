gem 'faker'

FactoryBot.define do

  factory :ticket do
    name { Faker::TvShows::TwinPeaks.name }
    description {'fake ticket'}
    phone {'+1-555-555-5555'}
    region_id { create(:region).id }
    resource_category_id { create(:resource_category).id }
  end

end