class Order < ApplicationRecord
  belongs_to :user
  belongs_to :availability
  validates :portions, presence: true
end
