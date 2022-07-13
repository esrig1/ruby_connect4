class Board
    @gameboard = nil
    def init_new_gameboard
        @gameboard = Array.new(6, Array.new(7, " "))
    end

    def print_game
        print "|"
        (1..7).each do |num|
            print " #{num} "
        end
        print "|"
        puts
        @gameboard.each do |array|
            print "|"
            array.each do |symbol|
                print "   " if symbol == " "
            end
            print "|"
            puts   
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
        puts column
    end
end

board = Board.new
board.init_new_gameboard
board.print_game
player1 = Player.new("x")
player1.get_move