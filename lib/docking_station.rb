require_relative 'bike'

class DockingStation
  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def dock(bike, working = true)
    @bikes << bike
    bike.working = false if working == false
  end

  def release
    fail 'No bikes available' if bikes.empty?
    @bikes.pop
  end
end
