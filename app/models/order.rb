class Order < ApplicationRecord
  belongs_to :user
  belongs_to :availability
  validates :portions, presence: true
  validates :review_rating, inclusion: { in: 1..5}
end
