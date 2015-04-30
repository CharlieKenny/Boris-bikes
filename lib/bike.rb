class Bike

  attr_accessor :works

  def initialize (works = true)
    @works = works
  end

  def working?
    true


  end

  def report_broken
    @works = false
    @works
  end

  def broken?
    !@works
  end


end