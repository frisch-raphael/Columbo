# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Company.destroy_all
Engagement.destroy_all

test_types = ["Internal intrusion", "Phishing assessment", "External penetration test"]

3.times do |company_index|
  business_name = Faker::Company.name
  Company.create!(
    id: company_index,
    full_name: business_name,
    short_name: business_name[0..1],
    website: Faker::Internet.url,
    city: Faker::Address.city,
    address: Faker::Address.full_address
  )
  rand(4).times do |contact_index|
    Contact.create!(
      id: contact_index + (company_index * 10),
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone: Faker::PhoneNumber,
      title: Faker::Job.title,
      company_id: company_index
    )
  end
end

3.times do |report_index|
  date_backward = rand(365)
  Engagement.create!(
    id: report_index,
    title: test_types[report_index],
    start_date: Faker::Date.backward(days: date_backward),
    end_date: Faker::Date.backward(days: date_backward - rand(10)),
    scoring: rand(2),
    state: rand(2),
    language: 'french',
    company_id: rand(3)
  )
end



