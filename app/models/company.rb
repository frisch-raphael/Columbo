class Company < ApplicationRecord
  has_many :contacts

  validates :Name, presence: true
end
