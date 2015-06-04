require_relative 'garage'
require_relative 'bike'
class Van

  attr_accessor :contents

  def initialize
    @contents = []
  end

  def collect bike
    @contents.push bike
  end

  def deliver garage
    @contents.each do |bike|
      @contents.pop
      garage.repair_contents.push bike
    end
  end
end

