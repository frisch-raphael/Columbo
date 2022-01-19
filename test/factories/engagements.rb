# frozen_string_literal: true

FactoryBot.define do
  test_types = ['Internal intrusion', 'Phishing assessment', 'External penetration test']
  date_backward = rand(365)

  factory :engagement do
    title { 'Contoso - ' + test_types[rand(3)] }
    state { rand(2) }
    assessment_type { test_types[rand(3)] }
    trait :with_optionals do

      start_date { Faker::Date.backward(days: date_backward) }
      end_date { Faker::Date.backward(days: date_backward - rand(10)) }
      scoring { rand(2) }
      language { 'french' }
    end
    trait :with_company do
      association :company, :with_optionals
    end

    factory :nested_engagement do
      transient do
        contacts_count { 3 }
      end

      after(:create) do |engagement, evaluator|
        create_list(:contact, evaluator.contacts_count, :with_optionals, engagement: engagement)
        create(:company, :with_optionals, engagement: engagement)
      end
      # contacts do
      #   Array.new(contacts_count) { association(:contact, engagement: engagement) }
      # end
    end

  end
end
