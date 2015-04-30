feature 'member of public returns bike' do

let(:docking_station) { DockingStation.new }

scenario 'bike can be reported broken when returned' do
    bike = Bike.new
    bike.report_broken
    expect { docking_station.dock bike }.not_to raise_error
  end

scenario 'docking station does not release broken bikes' do
    bike = Bike.new
    bike.report_broken
    docking_station.dock bike
    expect { docking_station.release_bike }.to raise_error 'No bikes available'
  end

scenario 'bike cannot be docked when station is full' do
    docking_station.capacity.times { docking_station.dock Bike.new }
    expect {docking_station.dock Bike.new}.to raise_error 'Docking station full'
  end
end