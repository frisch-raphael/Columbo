class Contact < ApplicationRecord

  validates :LastName, presence: true

  belongs_to :Company

end
