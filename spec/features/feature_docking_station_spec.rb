feature 'Should create new docking station' do
  scenario 'default capacity' do
    docking_station = DockingStation.new
    expect(docking_station.capacity).to eq docking_station.capacity
  end

  scenario 'custom capacity 50' do
    docking_station = DockingStation.new 50
    expect(docking_station.capacity).to eq 50
  end

end

feature 'Should be able to access docking station' do

  scenario 'Get working bike from docking station' do
    docking_station = DockingStation.new
      docking_station.dock Bike.new
    bike = docking_station.release_bike
    expect(bike).to be_working
  end

  scenario 'Station does not release bike when none available' do
    docking_station = DockingStation.new
    expect { docking_station.release_bike }.to raise_error 'No bikes here!'
  end
end