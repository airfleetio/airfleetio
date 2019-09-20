require 'fleetio'

# Fetches the list of vehicles from Fleet.io.
class FetchVehiclesJob < ActiveJob::Base
  queue_as :default

  def perform
    Fleetio::Vehicle.all.each do |fleetio_vehicle|
      vehicle = Vehicle.find_or_initialize_by vin: fleetio_vehicle.vin
      vehicle.uuid = fleetio_vehicle.uuid
      vehicle.make = fleetio_vehicle.make
      vehicle.model = fleetio_vehicle.model
      vehicle.year = fleetio_vehicle.year
      vehicle.save if vehicle.changed?
    end
  end
end
