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
end