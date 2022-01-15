FactoryBot.define do
  factory :company do
    full_name { Faker::Company.name }

    trait :with_optionals do
      short_name { Faker::Company.name[0..2] }
      website { Faker::Internet.url }
      city { Faker::Address.city }
      address { Faker::Address.full_address }
      # posts_count is declared as a transient attribute available in the
      # callback via the evaluator
    end

    factory :company_with_contacts do
      transient do
        contacts_count { 5 }
      end

      contacts do
        Array.new(contacts_count) { association(:contact) }
      end
    end

    factory :company_with_engagement do
      association :engagement
      # transient do
      #   engagements_count { 5 }
      # end
      #
      # engagements do
      #   Array.new(engagements_count) { association(:engagement, :with_company) }
      # end
    end

  end
end

# def company_with_contacts(count: 5)
#   FactoryBot.create(:contact) do |contact|
#     FactoryBot.create_list(:company, count, contact: contact)
#   end
# end
