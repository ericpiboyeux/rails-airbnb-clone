class Dish < ApplicationRecord
  has_attachment :photo
  belongs_to :user
  has_many :availabilities
  validates :name, presence: true
end
