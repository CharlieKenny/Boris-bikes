require_relative 'bike'

class DockingStation
  attr_accessor :bikes, :capacity

  def initialize
    @bikes = []
    @capacity = 20
  end

  def dock(bike, working = true)
    fail 'Station is full' if bikes.count == @capacity
    @bikes << bike
    bike.working = false if working == false
  end

  def release
    fail 'No bikes available' if bikes.select(&:working?).empty?
    @bikes.pop
  end
end
