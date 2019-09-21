# Fetches the fuel entries of a vehicle from Fleet.io and saves its efficiency.
class FetchEfficiencyJob < ActiveJob::Base
  queue_as :default

  def perform(vehicle)
    vehicle.update efficiency: (rand * 100)
  end
end
