class Company < ApplicationRecord
  has_many :contacts, dependent: :destroy
  # belongs_to :engagement
end
