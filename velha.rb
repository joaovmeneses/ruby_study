#config
rounds = 0
winner = 0
#players
p1 = 'player 1'
p2 = 'player 2'
#counter
counter = 1
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
    if(counter % 2 != 0) #impar
        puts "1 - Write your x,y positions"
        positions = gets.chomp.to_i
        verifyIfPositionIsValid(positions, matrix)
    else
        puts "2 - Write your x positions"
        positions = gets.chomp.to_i
        verifyIfPositionIsValid(positions, matrix)
    end

end

def start(counter, matrix)
    loop do
        puts "S T A R T\n"
        writeMatrix(matrix)
        askForPosition(counter, matrix)
        break if winner != 0
    end
end

start(counter, matrix)