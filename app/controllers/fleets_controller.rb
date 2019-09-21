class FleetsController < ApplicationController
  def show
    @vehicles = Vehicle.all
  end

  def update
    FetchVehiclesJob.perform_later
    redirect_to fleet_path, notice: 'Fleet is being updated.'
  end
end
