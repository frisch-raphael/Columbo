# frozen_string_literal: true

require_relative '../../app/models/poros/columbo_config'

FactoryBot.define do
  factory :template_finding do
    title { Faker::Lorem.sentence }
    trait :with_optionals do
      description { Faker::Lorem.paragraph }
      assessment_type { ColumboConfig.array_all_entries_for(:assessment_types)[rand(4)] }
      remediation_description { Faker::Lorem.paragraph }
    end
  end
end
