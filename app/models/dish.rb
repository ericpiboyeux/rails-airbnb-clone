class Dish < ApplicationRecord
  belongs_to :user
  has_many :availabilities
  validates :name, presence: true
end
