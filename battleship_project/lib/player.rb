class Player
    def get_move
        p "enter a position with coordinates serperated with a space like '4 7'"
        num = gets.chomp
        [num[0].to_i, num[2].to_i]
    end
end
