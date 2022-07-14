class Board
    @gameboard = nil
    def init_new_gameboard
        @gameboard = Array.new(6) { Array.new(7, " ") }
    end
    #for use by tester file
    def change_gameboard(i, j, symbol)
        @gameboard[i][j] = symbol
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
        (0..5).each do |i|
            (0..6).each do |j|
                #check if 4 of the same pieces are horizontal from eachother
                if(j < 5) 
                    check_arr = [@gameboard[i][j], @gameboard[i][j+1], @gameboard[i][j+2], @gameboard[i][j+3]]
                    #print check_arr
                    #print check_arr[0] == " "
                    #puts check_arr.uniq.length
                    if check_arr.uniq.length == 1 && check_arr[0] != " "
                        return true
                    end
                end
                #check if 4 pieces of the same peices are diagonal with a positive slop (pi/4 on unit circle)
                if(j < 5 && i > 2)
                    check_arr = [@gameboard[i][j], @gameboard[i-1][j+1], @gameboard[i-2][j+2], @gameboard[i-3][j+3]]
                    if check_arr.uniq.length == 1 && check_arr[0] != " "
                        return true
                    end
                end
            end
        end
        return false
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

    attr_accessor :gameboard
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

    attr_reader :sym
end

def execute_game(board, p1, p2)
    board.print_game
    while(true)
        
        board.place_move(p1.get_move, p1.sym)
        board.print_game
        if(board.check_winner?)
            puts "player 1 wins!"
            break
        end
        
        board.place_move(p2.get_move, p2.sym)
        board.print_game
        if(board.check_winner?)
            puts "player 2 wins!"
            break
        end
    end
end
=begin
p1 = Player.new("x")
p2 = Player.new("o")
board = Board.new
board.init_new_gameboard
execute_game(board, p1, p2)
    
=end


