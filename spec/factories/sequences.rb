FactoryBot.define do
  sequence :name do
    Faker::Name.unique.name
  end

  sequence :email do
    Faker::Internet.unique.email
  end

  sequence :description do

  end

  #sequence :


end
