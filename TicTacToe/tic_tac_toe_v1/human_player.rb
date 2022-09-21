class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end
    
    def get_position
        nums = ('0'..'9').to_a
        p "Player #{@mark}, enter two numbers representing a position in format 'row col'"
        num = gets.chomp.split(" ")
        raise "sorry, that was invalid" if num.length != 2 || num.any? {|ele| !nums.include?(ele)}
        num.map{|ele| ele.to_i}   
    end
end