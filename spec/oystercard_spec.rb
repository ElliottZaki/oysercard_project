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
        # it { is_expected.to respond_to(:deduct).with(1).argument }
        # subject.balance = Oystercard::MINIMUM_FARE
        # expect { subject.send(:deduct, Oystercard::MINIMUM_FARE) }.to change { subject.balance }.by(-1)
  

        it 'deducts amount' do
            #arrange
            oystercard.top_up(10)
            #assert
            expect { oystercard.touch_out }.to change { oystercard.balance }.by (- Oystercard::MIN_AMOUNT)   
        end
    end 

    describe '#in_journey?' do
        it { is_expected.to respond_to(:in_journey?) }
    end

    describe '#touch_in' do
        it { is_expected.to respond_to(:touch_in) }

        it 'is expected to touch_in to start journey' do
            #expect { oystercard.touch_in }.to change{ oystercard.in_journey? }.to true 
            #arrange
            oystercard.top_up(Oystercard::MIN_AMOUNT)
            oystercard.touch_in
            #assert
            expect(oystercard).to be_in_journey
        end 

        it 'raises an error message if insufficent funds on card' do
            #arrange
            # oystercard.touch_in // balance = 0
            #asser
            expect{ oystercard.touch_in }.to raise_error "insufficent funds, minimum of £#{Oystercard::MIN_AMOUNT} is required."
        end
    end

    describe '#touch_out' do
        it { is_expected.to respond_to(:touch_out) }

        it 'is expected to touch_out to end journey' do
        #arrange
            oystercard.top_up(Oystercard::MIN_AMOUNT)
            oystercard.touch_in
            oystercard.touch_out
        #assert
            expect(oystercard).to_not be_in_journey
        end
        
        it 'deducts minimum fare during touch_out' do
            expect {oystercard.touch_out}.to change { oystercard.balance }.by (- Oystercard::MIN_AMOUNT)
        end 
    
    end

end 
