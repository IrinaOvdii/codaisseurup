FactoryBot.define do
  factory :event do
    name      { Faker::Lorem.words(3).join(' ') }
    description       { Faker::Lorem.sentence(40) }
    location           { Faker::Address.city }
    price             { Faker::Commerce.price }
    capacity          {15}
    includes_food     true
    includes_drinks   true
    starts_at          {Time.now + 10.days}
    ends_at             {Time.now + 11.days}
    active              true
    user              { build(:user) }
    


    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
