require_relative "board"
require_relative "player"

class Battleship
    attr_reader :player, :board
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = (n * n) / 2
    end

    def start_game 
        @board.place_random_ships
        p @board.print
        p @board.num_ships
    end 
    
    def lose?
        if @remaining_misses <= 0 
            p "you lose"
            return true
        else
            return false
        end
    end

    def win? 
        if @board.num_ships == 0
            p "you win"
            return true
        else
            return false
        end
    end

    def game_over?
        return true if win?||lose?
        false
    end

    def turn
        pos = @player.get_move
        @remaining_misses -= 1 if !@board.attack(pos)  
        p @remaining_misses
        @board.print
    end
end
