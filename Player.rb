class Player

    @name = ''
    @victories = 0
    
    def setName(name)
        @name = name
    end

    def addWins()
        @victories = @victories.to_i + 1
        puts "Total: #{@victories}"
    end

    def getWins()
        puts "Total: #{@victories}"
    end

    def getName()
        return @name;
    end
end