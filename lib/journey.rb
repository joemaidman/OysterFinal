class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :journey

  def initialize(station)
    @journey = {}
    @journey[:entry] = station
  end

  def end_journey(station)
    @journey[:exit] = station
  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY_FARE
  end

  def complete?
   !!@journey[:entry] && !!@journey[:exit]
     
  end

end
