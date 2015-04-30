feature 'user accesses docking station' do
	scenario 'docking station releases working bike' do
		docking_station = DockingStation.new
    docking_station.dock Bike.new
		bike = docking_station.release_bike
		expect(bike.working?).to eq true
	end
end