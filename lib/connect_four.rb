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
                print "  " if symbol == " "
            end
            print "|"
            puts   
        end   
    end
    attr_reader :gameboard
end

board = Board.new
board.init_new_gameboard
board.print_game