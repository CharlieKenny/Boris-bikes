require 'docking_station'

feature 'member of public accesses bike' do 
  let(:docking_station) {DockingStation.new}

  scenario 'docking station releases working bike' do
    docking_station.dock Bike.new
    bike = docking_station.release_bike
    expect(bike).to be_working
  end

  scenario 'docking station does not release bikes when there are none available' do 
    expect{docking_station.release_bike}.to raise_error 'No bikes available'
  end

  scenario 'docking station does not relase broken bikes' do 
    bike = Bike.new
    bike.report_broken
    docking_station.dock bike
    expect{docking_station.release_bike}.to raise_error 'No bikes available'
  end
end
