class Availability < ApplicationRecord
  belongs_to :dish
  has_one :order
  validates :portions, presence: true
end
