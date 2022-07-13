class Board
    @gameboard = nil
    def init_new_gameboard
        @gameboard = Array.new(6) { Array.new(7, " ") }
    end

    def print_game
        puts
        print "|"
        (1..7).each do |num|
            print " #{num} "
        end
        print "|"
        puts
        @gameboard.each do |array|
            print "|"
            array.each do |symbol|
                if symbol == " "
                    print "   "
                else
                    print " #{symbol} "
                end
            end
            print "|"
            puts   
        end   
    end

    def check_winner?
        (1..6).each do |i|
            (1..7).each do |j|
                #0pi win(unit circle)
                continue if(j > 4)
                if @gameboard[i][j] == @gameboard[i][j+1] 
                end
            end
        end
    end

    def place_move(col, symbol)
        if @gameboard[0][col-1] != " "
           raise "Column is already full"
        end
        5.downto(0) do |index|
            if @gameboard[index][col-1] == " " 
                @gameboard[index][col-1] = symbol
                return
            end
        end
    end

    attr_reader :gameboard
end

class Player
    def initialize(sym)
        @sym = sym
    end

    def get_move
        puts "Enter in a column to make your move in"
        column = gets.chomp.to_i
        while column > 7 || column < 1 do
            puts "Your move wasn't a valid column, enter a valid column"
            column = gets.chomp.to_i
        end
        return column
    end

    
end


