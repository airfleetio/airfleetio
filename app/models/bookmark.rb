class Bookmark
  include ActiveModel::Model
  attr_accessor :vin

  def save
    vehicle = Vehicle.find_by vin: vin

    if vehicle.nil?
      errors.add :vin, :not_found, message: 'was not found'
      false
    elsif vehicle.bookmarked?
      errors.add :vin, :invalid, message: 'was already saved'
      false
    else
      vehicle.update bookmarked: true
    end
  end
end
