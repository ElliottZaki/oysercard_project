class Oystercard

attr_reader :balance

    def initialize 
        @balance = 0
    end

    def top_up(value)
        
        raise "Cannot exceed limit (£90)" if @balance + value > 90
        
        @balance = @balance + value
    
        # if @balance + value > 90
        #     raise "Cannot exceed limit (£90)"
        # else 
        #     @balance = @balance + value
        # end
    end

end



#conditional ? 'return this if true' : 'else return this'