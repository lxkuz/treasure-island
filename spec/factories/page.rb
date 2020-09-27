FactoryBot.define do
  factory :page do
    name { Faker::Name.name }
    path { Faker::Lorem.word }
  end
end
