require 'docking_station'

describe DockingStation do
  let(:docking_station) { DockingStation.new }
  it { is_expected.to respond_to :release }
  it { is_expected.to respond_to :dock }

  it 'should dock a bike' do
    bike = double :bike
    docking_station.dock bike
    expect(docking_station.bikes.count).to be 1
  end

  it 'should release a bike' do
    bike = double :bike
    docking_station.dock bike
    docking_station.release
    expect(docking_station.bikes.count).to be 0
  end
end
