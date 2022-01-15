class Company < ApplicationRecord
  has_many :contacts, dependent: :destroy
  has_one :engagement, dependent: :nullify
  validates :full_name, presence: true
  # has_many :contacts, dependent: :
  # belongs_to :engagement
end
