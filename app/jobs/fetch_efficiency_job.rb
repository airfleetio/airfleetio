require 'fleetio'

# Fetches the fuel entries of a vehicle from Fleet.io and saves its efficiency.
class FetchEfficiencyJob < ActiveJob::Base
  queue_as :default

  def perform(vehicle)
    fuel_entries = Fleetio::FuelEntry.for vehicle.uuid
    return if fuel_entries.size < 1

    gallons = fuel_entries.to(-2).sum(&:gallons)
    miles = fuel_entries.first.miles - fuel_entries.last.miles

    vehicle.update efficiency: gallons/miles
  end
end
