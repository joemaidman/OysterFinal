# Oystercard Challenge

Reinforcing a test-driven development approach to create object-oriented code. This project emulates the basic infrastructure behind London's Oyster card travel payment system. Features include touching in and out of stations and calculating fares.

### Technologies Used
- Ruby
- Rspec

### User stories
```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete


In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

## Installation
- Clone the repo
- Run `bundle` to install dependencies

### Testing
- `cd` to the project folder
- Run `rspec`

### Running
- Run `irb`
- Example commands are shown below:

```
>> require './lib/journey.rb'
 => true
>> require './lib/oystercard.rb'
 => true
>> require './lib/station.rb'
 => false
>> kings_cross = Station.new("Kings Cross", 1)
 => #<Station:0x007fd56b3c83e8 @name="Kings Cross", @zone=1>
>> bow = Station.new("Bow", 2)
 => #<Station:0x007fd56b42b3d0 @name="Bow", @zone=2>
>> my_card = Oystercard.new()
 => #<Oystercard:0x007fd56b44b360 @balance=0, @all_journeys=[], @journey=#<Journey:0x007fd56b44b310 @journey={:entry=>nil}>>
>> my_card.top_up(50)
 => 50
>> my_card.touch_in(kings_cross)
 => #<Journey:0x007fd56c13c358 @journey={:entry=>#<Station:0x007fd56b3c83e8 @name="Kings Cross", @zone=1>}>
>> my_card.balance
 => 50
>> my_card.touch_out(bow)
 => #<Journey:0x007fd56c0fe008 @journey={:entry=>nil}>
>> my_card.balance
 => 49
>> my_card.touch_in(kings_cross)
 => #<Journey:0x007fd56b2139a8 @journey={:entry=>#<Station:0x007fd56b3c83e8 @name="Kings Cross", @zone=1>}>
>> my_card.touch_in(kings_cross)
 => #<Journey:0x007fd56b243e00 @journey={:entry=>#<Station:0x007fd56b3c83e8 @name="Kings Cross", @zone=1>}>
>> my_card.balance
 => 43
```

### Contributors
- Joe Maidman
- John Chang
- Albert Yanit
- Rory Mcguinness
- Imogen Kutz
- Vicky Roberts
