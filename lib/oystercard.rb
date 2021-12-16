class Oystercard

attr_accessor :balance

LIMIT = 90
MIN_AMOUNT = 1

    def initialize 
        @balance = 0
        @in_journey = false
    end

    def top_up(value)
        raise "Cannot exceed limit #{LIMIT}" if @balance + value > LIMIT
        @balance += value
    end

    def in_journey?
        @in_journey
    end

    def touch_in
        raise "insufficent funds, minimum of £#{MIN_AMOUNT} is required." if @balance < MIN_AMOUNT
        @in_journey = true
    end

    def touch_out
        deduct(MIN_AMOUNT)
        @in_journey = false
    end

    private
    def deduct(value)
        @balance -= value
    end


end




#conditional ? 'return this if true' : 'else return this'