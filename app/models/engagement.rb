class Engagement < ApplicationRecord
  belongs_to :company, optional: true
  validates :is_archived, presence: true
end
