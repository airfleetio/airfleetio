require 'fleetio'
require 'pusher'

# Fetches the fuel entries of a vehicle from Fleet.io and saves its efficiency.
class FetchEfficiencyJob < ActiveJob::Base
  queue_as :default
  include VehiclesHelper

  def perform(vehicle)
    broadcast vehicle, :info, 'Calculating efficiency'
    fuel_entries = Fleetio::FuelEntry.for vehicle.uuid

    if fuel_entries.size < 2
      broadcast vehicle, :warning, 'Not enough fuel entries'
    else
      efficiency = calculate_efficiency_from fuel_entries
      vehicle.update efficiency: efficiency
      broadcast vehicle, :success, format_efficiency(efficiency)
    end
  end

private

  def calculate_efficiency_from(fuel_entries)
    gallons = fuel_entries.to(-2).sum(&:gallons)
    miles = fuel_entries.first.miles - fuel_entries.last.miles
    gallons / miles
  end

  def broadcast(vehicle, status, message)
    payload = {uuid: vehicle.uuid, status: status, message: message}
    Pusher.trigger :efficiency, :progress, payload
  rescue Pusher::Error # ignore when Pusher is temporarily down
  end
end
