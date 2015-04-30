require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  it 'should default to 20' do
    docking_station = DockingStation.new
    expect(docking_station.capacity).to eq docking_station.instance_variable_get(:@capacity)
  end

  it 'should allow custom capacity' do
    docking_station = DockingStation.new 50
    expect(docking_station.capacity).to eq 50
  end

  it 'Should release a working bike' do
    subject.dock Bike.new
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it {is_expected.to respond_to(:dock).with(1).argument}

  it 'should raise error when full' do
    docking_station = DockingStation.new
    docking_station.instance_variable_get(:@capacity).times {subject.dock Bike.new}
    expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end

  describe 'release_bike' do
    it 'Raises error when no bikes are available' do
      expect { subject.release_bike }.to raise_error 'No bikes here!'
    end
  end
end