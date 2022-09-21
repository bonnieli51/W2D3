require "byebug"
class Board 
    def initialize
        @board = Array.new(3) {Array.new(3,"_")}
    end

    def [](arr)
        @board[arr[0]][arr[1]]
    end

    def []= (arr,mark)
        @board[arr[0]][arr[1]] = mark
    end 

    def valid?(position) # position = [1,2]
        nums = "012"
        position.all?{|ele| nums.include?(ele.to_s)}
    end

    def empty?(position)
        return true if self[position] == "_"
        false
    end

    def place_mark(position,mark)
        if empty?(position) && valid?(position)
            self[position] = mark 
        else 
            raise "Invalid Mark"
        end
    end

    def print
        @board.each {|row| puts row.join(" ")} 
    end

    def win_row?(mark)
        @board.any? do |row|
            row.all? {|ele| ele == mark}
        end
    end

    def win_col?(mark)
        (0...@board.length).any? do |i|
            @board.all? {|sub| sub[i]== mark}
        end
    end 

    def win_diagonal?(mark)
        if (0...@board.length).all? {|i| @board[i,i]== mark} || (0...@board.length).all? {|i| @board[i, @board.length-1-i]== mark}
            return true
        else
            false
        end    
    end

    def win? (mark)
        return true if win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
        false
    end  
        
    def empty_position?
        @board.flatten.any?{|ele| ele == "_"}
    end
end