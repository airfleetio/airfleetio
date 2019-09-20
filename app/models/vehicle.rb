class Vehicle < ApplicationRecord
  validates :vin, :year, :make, :model, presence: true
  validates :vin, uniqueness: true
  validates :year, length: {is: 4}

  scope :bookmarked, -> { where bookmarked: true }
end
