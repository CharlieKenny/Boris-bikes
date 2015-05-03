require 'docking_station'

feature DockingStation do
  let(:docking_station) { DockingStation.new }
  let(:bike) { Bike.new }

  scenario 'should dock a bike into a docking station' do
    docking_station.dock bike
    expect(docking_station.bikes.count).to be 1
  end

  scenario 'should decrease count when releasing bike' do
    docking_station.dock bike
    docking_station.release
    expect(docking_station.bikes.count).to be 0
  end

  scenario 'should release a working bike' do
    docking_station.dock bike
    docking_station.release
    expect(bike.working).to be true
  end

  scenario 'should throw error if no bikes available' do
    expect { docking_station.release }.to raise_error 'No bikes available'
  end
end
