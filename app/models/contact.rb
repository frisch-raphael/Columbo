class Contact < ApplicationRecord
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :company, presence: true
  belongs_to :company
end
