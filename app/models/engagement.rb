class Engagement < ApplicationRecord
  belongs_to :company, optional: true
  validates :state, presence: true
  validates :title, presence: true
end
