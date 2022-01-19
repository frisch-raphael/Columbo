class Engagement < ApplicationRecord
  has_one :company, dependent: :destroy
  has_many :contacts, dependent: :destroy
  validates :state, presence: true
  validates :title, presence: true
end
