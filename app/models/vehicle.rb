class Vehicle < ApplicationRecord
  validates :vin, :year, :make, :model, presence: true
  validates :vin, uniqueness: true
  validates :year, length: {is: 4}

  scope :bookmarked, -> { where.not(bookmarked_at: nil).order(bookmarked_at: :desc) }

  def bookmarked?
    bookmarked_at.present?
  end
end
