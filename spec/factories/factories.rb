gem 'faker'

FactoryBot.define do

  factory :resource_category do
    name {'test resource_category'}
    active {true}
  end

  factory :region do
    name {"Fake Region"}
  end



end
