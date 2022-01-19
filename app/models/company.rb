class Company < ApplicationRecord
  belongs_to :engagement
  validates :full_name, presence: true
  # has_many :contacts, dependent: :
  # belongs_to :engagement
end
