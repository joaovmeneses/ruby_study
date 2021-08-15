require './Player.rb'

#matrix 3x3
$matrix = [["#","#","#"],["#","#","#"],["#","#","#"]]
$player_1 = Player.new
$player_2 = Player.new

#functions
def writeMatrix()

    text = ''
    print("  1 2 3\n")
    for i in 0..$matrix.length-1 do

        print "#{i+1} #{$matrix[i][0..2].to_s.gsub('[','').gsub(']','').gsub(',','').gsub('"', '')}"

        print "\n"
    end

end

def verifyIfPositionIsValid(positions)

    array = positions.split(',')
    x = array[0]
    y = array[1]
    #verify if points(x and y) it's out
    if(array.length > 2 || (x.to_i)-1 > 2 || (y.to_i)-1 > 2)
        return 0
    end
    #verifiy if poit it's free
    if($matrix[(x.to_i)-1][(y.to_i)-1] != '#')
        return 0
    end

    return array

end

def verifyIfWin(marker)
    #ROWS
    if($matrix[0][0] == marker && $matrix[0][1] == marker && $matrix[0][2] == marker)
        return marker
    elsif($matrix[1][0] == marker && $matrix[1][1] == marker && $matrix[1][2] == marker)
        return marker
    elsif($matrix[2][0] == marker && $matrix[2][1] == marker && $matrix[2][2] == marker)
        return marker
    #COLUMNS
    elsif($matrix[0][0] == marker && $matrix[1][0] == marker && $matrix[2][0] == marker)
        return marker
    elsif($matrix[1][1] == marker && $matrix[1][1] == marker && $matrix[2][1] == marker)
        return marker
    elsif($matrix[0][2] == marker && $matrix[1][2] == marker && $matrix[2][2] == marker)
        return marker
    #DIAGONALS
    elsif($matrix[0][0] == marker && $matrix[1][1] == marker && $matrix[2][2] == marker)
        return marker
    elsif($matrix[0][2] == marker && $matrix[1][1] == marker && $matrix[2][0] == marker)
        return marker
    end

    return false
end

def setPositions(positions, player)
    response = verifyIfPositionIsValid(positions)
    if(response.class == Array)
        if(player == 1)
            $matrix[(response[0].to_i)-1][(response[1].to_i)-1] = 'X'
            return verifyIfWin('X')
        else
            $matrix[(response[0].to_i)-1][(response[1].to_i)-1] = 'O'
            return verifyIfWin('O')
        end
    else
        return -1
    end
    
end

def askForPosition(counter)
    if(counter % 2 == 0) #par
        print "Player 2 - Write your x,y positions: \n"
        positions = gets.chomp
        return setPositions(positions, 2)
    else
        print "Player 1 - Write your x,y positions: \n"
        positions = gets.chomp
        return setPositions(positions, 1)
    end

end

def start()
    rounds = 9
    while rounds > 0
        writeMatrix()
        response = askForPosition(rounds)
        if(response == -1) #repeat round
            rounds+1
        elsif(response != false && response != -1) #somebody wins
            break
        end
        #clear console
        system "clear"
        rounds-1
    end

    print "#########################################\n"
    print "#########################################\n"
    print "############### G 4 M 3 #################\n"
    print "############### 0 V 3 R #################\n"
    print "#########################################\n"
    print "#########################################\n"

end

def welcome()
    system "clear"
    print "Welcome #{$player_1.getName} and #{$player_2.getName}.\n"

    sleep(1)
    system "clear"
    print "Welcome #{$player_1.getName} and #{$player_2.getName}..\n"

    sleep(1)
    system "clear"
    print "Welcome #{$player_1.getName} and #{$player_2.getName}...!\n"
    sleep(1)

    print "Intructions:\n"
    sleep(1)
    
    puts "The positions need be writed like: 1,1 or 2,3 \n"
    puts "The max and min position, to x and y respectively, is 3 and 1 \n"
    sleep(5.0)
    system "clear"

    puts "S\n"
    sleep(0.5)
    system "clear"

    puts "S T\n"
    sleep(0.5)
    system "clear"

    puts "S T A\n"
    sleep(0.5)
    system "clear"

    puts "S T A R\n"
    sleep(0.5)
    system "clear"

    puts "S T A R T\n"
    sleep(0.5)
    system "clear"
end

def cadastre()
    print("Put your name, player 1:\n")
    $player_1.setName(gets.chomp)
    print("Put your name, player 2:\n")
    $player_2.setName(gets.chomp)
end

#G A M E
cadastre()
welcome()
start()