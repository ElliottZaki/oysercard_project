require 'oystercard'

describe Oystercard do
    subject (:oystercard) {Oystercard.new}

    it 'has a balance of zero' do
        expect(oystercard.balance).to eq(0)
    end

    describe '#top_up' do
        it { is_expected.to respond_to(:top_up).with(1).argument }

        it 'can top_up' do
            expect{ oystercard.top_up(1) }.to change{ oystercard.balance }.by (1)
        end 

        it 'raises an error message when card exceeds limit' do
            #arrange
            oystercard.top_up(Oystercard::LIMIT) 
            #act
            #assert
            expect { oystercard.top_up(1) }.to raise_error "Cannot exceed limit #{Oystercard::LIMIT}"
        end
    end

    describe '#deduct' do
        it { is_expected.to respond_to(:deduct).with(1).argument }

        it 'deducts amount' do
            #arrange
            oystercard.top_up(10)
            #assert
            expect { oystercard.deduct(1) }.to change { oystercard.balance }.by (-1)
        end
    end 

    describe '#in_journey?' do
        it { is_expected.to respond_to(:in_journey?) }
    end

    describe '#touch_in' do
        it { is_expected.to respond_to(:touch_in) }

        it 'touch_in to start journey' do
            #expect { oystercard.touch_in }.to change{ oystercard.in_journey? }.to true 
            #arrange
            oystercard.touch_in
            #assert
            expect(oystercard).to be_in_journey
        end 
    end

    describe '#touch_out' do
        it { is_expected.to respond_to(:touch_out) }
    end

    #expect(oystercard).to be_in_journey
    #expect to_not 
        
end 
