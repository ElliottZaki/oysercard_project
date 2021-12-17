class Oystercard

attr_accessor :balance, :entry_station

LIMIT = 90
MIN_AMOUNT = 1

    def initialize 
        @balance = 0
        @entry_station = nil 
    end

    def top_up(value)
        raise "Cannot exceed limit #{LIMIT}" if @balance + value > LIMIT
        @balance += value
    end

    def in_journey?
        !!entry_station
    end

    def touch_in(station)
        raise "insufficent funds, minimum of £#{MIN_AMOUNT} to touch in." if @balance < MIN_AMOUNT
        @entry_station = station
    end

    def touch_out(station)
        deduct(MIN_AMOUNT)
        @entry_station = nil
    end

   # def generate_station
    #    stations = [:aldgate, :baker_street, :kings_cross]
    #    stations[oystercard.rand(stations.length)]
   # end

    private
    def deduct(value)
        @balance -= value
    end


end




#conditional ? 'return this if true' : 'else return this'