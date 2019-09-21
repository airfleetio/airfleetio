namespace :fleetio do
  # Meant to run every hour with Heroku Scheduler
  desc 'Refresh list of vehicles from Fleet.io'
  task fetch_vehicles: :environment do
    FetchVehiclesJob.perform_later
  end
end
