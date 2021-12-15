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
            oystercard.top_up(90)
            #act
            #assert
            expect { oystercard.top_up(1) }.to raise_error("Cannot exceed limit (£90)") 
        end

       
        

    end
        
end 
