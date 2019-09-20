require 'rest-client'

# A basic client for the fleet.io API
module Fleetio
  class Vehicle
    attr_reader :uuid, :vin, :make, :model, :year

    def initialize(params = {})
      @uuid = params[:id]
      @vin = params[:vin]
      @make = params[:make]
      @model = params[:model]
      @year = params[:year]
    end

    def self.invalid?(params = {})
      params[:vin].blank? || params[:make].blank? || params[:model].blank?
    end

    def self.all
      Request.fetch(path: '/vehicles').reject(&method(:invalid?)).map do |vehicle_attributes|
        new vehicle_attributes
      end
    end
  end

  class Request
    def self.fetch(path:)
      url = "https://secure.fleetio.com/api/v1#{path}"
      response = RestClient.get url, headers
      JSON.parse response.body, symbolize_names: true
    end

  private

    def self.headers
      auth_token = Rails.application.credentials.dig :fleetio, :auth_token
      account_token = Rails.application.credentials.dig :fleetio, :account_token
      {'Authorization': %{Token token="#{auth_token}"}, 'Account-Token': account_token}
    end
  end
end
