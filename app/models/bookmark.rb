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
      vehicle.update(bookmarked_at: Time.current).tap do |success|
        FetchEfficiencyJob.set(wait: 0.5.seconds).perform_later(vehicle) if success
      end
    end
  end
end
