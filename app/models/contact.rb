class Contact < ApplicationRecord
  validates :last_name, presence: true, allow_blank: false
  validates :first_name, presence: true, allow_blank: false
  belongs_to :engagement
end
