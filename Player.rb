class Player

    @name = ''
    @wins = 0
    
    def setName(name)
        @name = name
    end

    def addWins()
        @wins = @wins.to_i + 1
        puts "Total: #{@wins}"
    end

    def getWins()
        puts "Total: #{@wins}"
    end

    def getName()
        return @name;
    end
end