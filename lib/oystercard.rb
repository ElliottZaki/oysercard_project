class Oystercard

attr_reader :balance
LIMIT = 90

    def initialize 
        @balance = 0
    end

    def top_up(value)
        raise "Cannot exceed limit #{Oystercard::LIMIT}" if @balance + value > LIMIT

        @balance += value
    end

    def deduct(value)
        @balance -= value
    end 

end



#conditional ? 'return this if true' : 'else return this'