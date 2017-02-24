require 'journey'
require 'oystercard'

describe Journey do

  let(:entry_station) {"Bank Station"}
  let(:exit_station) {"Oxford Circus"}

  context 'Given an entry station' do
    subject(:journey) { described_class.new(entry_station) }

    it 'has an entry station' do
      expect(journey.journey[:entry]).to eq entry_station
    end
    it 'allows a journey to end and sets the exit station' do
      expect{ journey.end_journey(exit_station) }.to change { journey.journey[:exit] }.to exit_station
    end

    it 'gives a penalty fare if no entry station was recorded' do
      journey.journey[:entry] = nil
      journey.end_journey(exit_station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end


    describe '.fare' do
      it 'gives a penalty fare if no exit station was recorded' do
        expect(journey.fare).to eq Journey::PENALTY_FARE
      end
      it 'gives the minimum fare if the journey was completed' do
        journey.end_journey(exit_station)
        expect(journey.fare).to eq Journey::MINIMUM_FARE
      end
    end

    describe '.complete?' do
      it 'returns false when journey is not complete' do
        expect(journey.complete?).to be false
      end
      it 'returns true when journey is complete' do
        journey.end_journey(exit_station)
        expect(journey.complete?).to be true
      end
    end

  end


end
