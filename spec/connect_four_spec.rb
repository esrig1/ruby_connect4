require './lib/connect_four.rb'

describe Board do
    
    describe "#place_move" do
        board = Board.new
        board.init_new_gameboard
        it "adds piece on empty gameboard" do
            
            board.place_move(2, "x")
            expect(board.gameboard[5][1]).to eql("x")
        end

        it "adds a piece on top of an existing peice" do
            board.place_move(2, "x")
            expect(board.gameboard[4][1]).to eql("x")
        end

        it "raises an error when column is full" do
            board.place_move(2, "x")
            board.place_move(2, "x")
            board.place_move(2, "x")
            board.place_move(2, "x")
            expect {
                board.place_move(2, "x")
            }.to raise_error("Column is already full")
        end
    end

    describe "#check_winner?" do
        board = Board.new
        board.init_new_gameboard
        it "declares a winner when 4 of the same gamepieces are horizontal" do
            board.init_new_gameboard
            board.place_move(2, "x")
            board.place_move(3, "x")
            board.place_move(4, "x")
            board.place_move(5, "x")
            expect(board.check_winner?).to eql(true)
        end

        it "declares a winner when 4 of the same gamepieces are vertical" do
            board.init_new_gameboard
            board.place_move(2, "x")
            board.place_move(2, "x")
            board.place_move(2, "x")
            board.place_move(2, "x")
            expect(board.check_winner?).to eql(true)
        end
        
        it "declares a winner when 4 of the same gamepieces are diagonal with a positive slope" do
            board.init_new_gameboard
            board.change_gameboard(5, 0, "x")
            board.change_gameboard(4, 1, "x")
            board.change_gameboard(3, 2, "x")
            board.change_gameboard(2, 3, "x")
            board.print_game
            expect(board.check_winner?).to eql(true)
        end
        it "declares a winner when 4 of the same gamepieces are diagonal with a negative slope" do
            board.init_new_gameboard
            board.change_gameboard(5, 3, "x")
            board.change_gameboard(4, 2, "x")
            board.change_gameboard(3, 1, "x")
            board.change_gameboard(2, 0, "x")
            expect(board.check_winner?).to eql(true)
        end


    end

end