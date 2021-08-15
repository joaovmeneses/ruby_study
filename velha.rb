#matrix 3x3
matrix = [[0,0,0],[0,0,0],[0,0,0]]

#functions

def writeMatrix(matrix)
    text = ''
    for i in 0..matrix.length-1 do
        print matrix[i][0..2].to_s.gsub('[','').gsub(']','').gsub(',','')
        print "\n"
    end
end

def verifyIfPositionIsValid(positions, matrix)
    
end

def askForPosition(counter, matrix)
    if(counter % 2 == 0) #par
        print "1 - Write your x,y positions. Like: '1,2'"
        positions = gets.chomp.to_i
        verifyIfPositionIsValid(positions, matrix)
    else
        print "2 - Write your x positions. Like: '1,2'"
        positions = gets.chomp.to_i
        verifyIfPositionIsValid(positions, matrix)
    end

end

def start(matrix)
    puts "S T A R T\n"
    for i in 0..8 do
        writeMatrix(matrix)
        askForPosition(i, matrix)
        break if winner != 0
    end
end

start(matrix)