require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new}
  let(:top_up_amount) {20}
  let(:entry_station) {double :station}
  let(:exit_station) {double :station}

  describe "#balance", :balance do
    it "has an initial balance of zero" do
      expect(card.balance).to eq 0
    end
  end

  describe ".top_up" do
    it "increases the balance when topped up" do
      card.top_up(top_up_amount)
      expect(card.balance).to eq(top_up_amount)
    end
    it "raises an error if the maximum balance is exceeded" do
      card.top_up(Oystercard::LIMIT)
      expect{card.top_up(1)}.to raise_error("Maximum balance of #{Oystercard::LIMIT} exceeded")
    end
  end

  describe ".touch_in" do
    it "doesn't allow touch in when balance below the minimum" do
      expect{card.touch_in(entry_station)}.to raise_error "Insufficient funds, current balance is £#{card.balance}"
    end
  end

  describe '.touch_out' do
    it 'reduces the balance by the fare amount' do
      card.top_up(top_up_amount)
      card.touch_in(entry_station)
      expect{card.touch_out(exit_station)}.to change{card.balance}.by(-Journey::MINIMUM_FARE)
    end
  end

  describe '#all_journeys' do
    before do
      card.top_up(top_up_amount)
    end

    it 'checks to see if the journeys list is empty by default' do
      expect(card.all_journeys).to be_empty
    end
    it 'records a single journey in a hash, which is appended to an array' do
      card.touch_in("Kingston")
      card.touch_out("Whitechapel")
      expect(card.all_journeys.length).to eq(1)
    end
  end

end
