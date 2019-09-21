require 'fleetio'
RSpec.describe Fleetio::Vehicle do
  describe '.all' do
    subject { Fleetio::Vehicle.all }

    it 'returns the list of vehicles for the fleet.io account' do
      expect(subject).to be_an(Array)
      expect(subject.map(&:uuid)).to all be_present.and be_a(Integer)
      expect(subject.map(&:vin)).to all be_present.and be_a(String)
      expect(subject.map(&:make)).to all be_present.and be_a(String)
      expect(subject.map(&:model)).to all be_present.and be_a(String)
      expect(subject.map(&:year)).to all be_present.and be_an(Integer)
    end
  end
end

RSpec.describe Fleetio::FuelEntry do
  describe '.for' do
    let(:vehicle_id) { Fleetio::Vehicle.all.first.uuid }
    subject { Fleetio::FuelEntry.for(vehicle_id) }

    it 'returns the list of miles and gallons for the fleet.io vehicle' do
      expect(subject).to be_an(Array)
      expect(subject.map(&:miles)).to all be_present.and be_a(Float)
      expect(subject.map(&:gallons)).to all be_present.and be_a(Float)
    end
  end
end
