require_relative "human_player"
require_relative "board"

class Game
    
    def initialize(mark1, mark2)
        @player_1 = HumanPlayer.new(mark1)
        @player_2 = HumanPlayer.new(mark2)
        @board = Board.new
        @current_player = @player_1
    end

    def switch_turn
       if @current_player == @player_1
            @current_player = @player_2
       else 
            @current_player = @player_1
       end
    end

    def play 
        while @board.empty_position?
            @board.print
            position = @current_player.get_position
            @board.place_mark(position,@current_player.mark)
            if @board.win?(@current_player.mark)
                return "victory"
            else 
                self.switch_turn
            end
        end
        p "draw"
    end
end