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

def setPositions(positions, matrix)
    response = verifyIfPositionIsValid(positions, matrix)
    if(response.class == Array)
        matrix[(response[0].to_i)-1][(response[1].to_i)-1] = 'X'
    else
        print response.class
    end
end

def askForPosition(counter, matrix)
    if(counter % 2 == 0) #par
        print "1 - Write your x,y positions. Like: '1,2': \n"
        positions = gets.chomp
        setPositions(positions, matrix)
    else
        print "2 - Write your x positions. Like: '1,2': \n"
        positions = gets.chomp
        setPositions(positions, matrix)
    end

end

def start(matrix)
    puts "S T A R T\n"
    rounds = 8
    for i in 0..rounds do
        writeMatrix(matrix)
        askForPosition(i, matrix)
        rounds = 1
    end

    print "#########################################\n"
    print "#########################################\n"
    print "############### G A M E #################\n"
    print "############### O V E R #################\n"
    print "#########################################\n"
    print "#########################################\n"

end

start(matrix)