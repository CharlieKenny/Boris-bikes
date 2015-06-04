require 'van'
require 'bike'
require 'garage'
require 'docking_station'

# As a maintainer of the system,
# So that I can manage broken bikes and not disappoint users,
# I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.

feature 'Vans can pick up bikes from Docking Stations' do 
  scenario 'and deliver them to garages' do
    docking_station = DockingStation.new
    van = Van.new
    garage = Garage.new
    bike = Bike.new
    bike.report_broken
    van.collect(bike)
    van.deliver(garage)
  end
end
