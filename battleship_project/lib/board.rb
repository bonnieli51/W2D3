require "byebug"
class Board
attr_reader :size
  def initialize(n)
    @grid = Array.new(n) {Array.new(n,:N)}
    @size = n * n 
  end

  def [](arr)
    @grid[arr[0]][arr[1]]
  end

  def []= (pos,value) #board[pos] = :S  == board.[] = (pos,:S)  
    @grid[pos[0]][pos[1]] = value 
  end

  def num_ships
    @grid.flatten.count {|ele| ele == :S}
  end
  
  def attack(pos)
    if self[pos] == :S 
        self[pos] = :H
        p "you sunk my battleship!"
        return true
    else
        self[pos] = :X
        return false 
    end
  end

  def place_random_ships
    num = size / 4 
    while num_ships != num 
        rand_r = rand(0...@grid.length)
        rand_c = rand(0...@grid.length)
        pos = [rand_r, rand_c]
        self[pos] = :S
    end
  end

  def hidden_ships_grid
    n = @grid.length
    new_grid = Array.new(n) {Array.new(n)}
    new_grid.each_with_index do |row,i| #row
        row.each_with_index do |ele, k|
            pos = [i,k]
            if self[pos] == :S 
                new_grid[i][k] = :N
            else 
                new_grid[i][k] = self[pos]
            end
        end
    end
    new_grid
  end

  def self.print_grid(grid)
    grid.each do |row|
        puts row.join(" ")
    end
  end

  def cheat 
    Board.print_grid(@grid)
  end

  def print 
    Board.print_grid(hidden_ships_grid)
  end
end
