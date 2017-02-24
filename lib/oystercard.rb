require_relative 'journey'
require_relative 'station'

class Oystercard

  LIMIT = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance, :all_journeys

  def initialize
    @balance = 0
    @all_journeys = []
    @journey = Journey.new(nil)
  end

  def top_up(amount)
    raise "Maximum balance of #{LIMIT} exceeded" if @balance + amount > LIMIT
    raise "Unable to top-up." if amount < MINIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient funds, current balance is £#{@balance}" unless sufficient_funds?
    deduct(@journey.fare) if @journey.journey[:entry] != nil
    @journey = Journey.new(station)
  end

  def touch_out(station)
    @journey.end_journey(station)
    deduct(@journey.fare)
    @all_journeys << @journey.journey
    @journey = Journey.new(nil)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def sufficient_funds?
    @balance >= MINIMUM_BALANCE
  end

end
