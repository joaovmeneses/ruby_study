#matrix 3x3
matrix = [["#","#","#"],["#","#","#"],["#","#","#"]]

#functions
def writeMatrix(matrix)

    text = ''
    print("  1 2 3\n")
    for i in 0..matrix.length-1 do

        print "#{i+1} #{matrix[i][0..2].to_s.gsub('[','').gsub(']','').gsub(',','').gsub('"', '')}"

        print "\n"
    end

end

def verifyIfPositionIsValid(positions, matrix)

    array = positions.split(',')
    x = array[0]
    y = array[1]
    if(array.length > 2 || (x.to_i)-1 > 2 || (y.to_i)-1 > 2)
        return 0
    end

    return array

end

def verifyIfWin(marker, matrix)
    if(matrix[0][0] == marker && matrix[0][1] == marker && matrix[0][2] == marker)
        return marker
    end
    return false
end

def setPositions(positions, matrix, player)
    response = verifyIfPositionIsValid(positions, matrix)
    if(response.class == Array)
        if(player == 1)
            matrix[(response[0].to_i)-1][(response[1].to_i)-1] = 'X'
            return verifyIfWin('X', matrix)
        else
            matrix[(response[0].to_i)-1][(response[1].to_i)-1] = 'O'
            return verifyIfWin('O', matrix)
        end
    else
        print response.class
    end
    
end

def askForPosition(counter, matrix)
    if(counter % 2 == 0) #par
        print "1 - Write your x,y positions. Like: '1,2': \n"
        positions = gets.chomp
        return setPositions(positions, matrix, 2)
    else
        print "2 - Write your x positions. Like: '1,2': \n"
        positions = gets.chomp
        return setPositions(positions, matrix, 1)
    end

end

def start(matrix)
    puts "S T A R T\n"
    rounds = 8
    for i in 0..rounds do
        writeMatrix(matrix)
        response = askForPosition(i, matrix)
        if(response != false)
            break
        end
    end

    print "#########################################\n"
    print "#########################################\n"
    print "############### G 4 M 3 #################\n"
    print "############### 0 V 3 R #################\n"
    print "#########################################\n"
    print "#########################################\n"

end

start(matrix)