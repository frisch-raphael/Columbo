FactoryBot.define do
  factory :contact do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    trait :with_optionals do
      phone { Faker::PhoneNumber }
      title { Faker::Job.title }
    end
    engagement
  end
end