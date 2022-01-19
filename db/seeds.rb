# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

Engagement.destroy_all
# Contact.destroy_all
# Company.destroy_all

# 3.times do
@engagement_with_company = FactoryBot.create(:engagement, :with_company)
# FactoryBot.create(:engagement)
# FactoryBot.create(:engagement)
# FactoryBot.create_list(:nested_engagement, 3, :with_optionals)
# end




