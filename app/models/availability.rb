class Availability < ApplicationRecord
  belongs_to :dish
  has_many :orders
  validates :portions, presence: true
  validates :available_datetime, presence: true

  def to_s
    available_datetime
  end
end
