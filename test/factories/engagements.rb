# frozen_string_literal: true

FactoryBot.define do
  test_types = ['Internal intrusion', 'Phishing assessment', 'External penetration test']
  date_backward = rand(365)

  factory :engagement do
    title { test_types[rand(3)] }
    state { rand(2) }
    trait :with_optionals do

      start_date { Faker::Date.backward(days: date_backward) }
      end_date { Faker::Date.backward(days: date_backward - rand(10)) }
      scoring { 2 }
      language { 'french' }
    end
    trait :with_company do
      company
    end
  end
end
