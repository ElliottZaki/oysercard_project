class Oystercard

attr_reader :balance
LIMIT = 90

    def initialize 
        @balance = 0
        @in_journey = false
    end

    def top_up(value)
        raise "Cannot exceed limit #{Oystercard::LIMIT}" if @balance + value > LIMIT
        @balance += value
    end

    def deduct(value)
        @balance -= value
    end 

    def in_journey?
        @in_journey
    end

    def touch_in
        @in_journey = true
    end

    def touch_out
        @in_journey = false
    end



end



#conditional ? 'return this if true' : 'else return this'