require_relative 'bike'

class DockingStation
  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def dock(bike)
    @bikes << bike
  end

  def release
    fail 'No bikes available' if bikes.empty?
    @bikes.pop
  end
end
