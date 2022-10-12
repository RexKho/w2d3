require "byebug"
class Board
    attr_reader :size
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n*n
    end

    def [](array)
        return @grid[array[0]][array[1]]
    end

    def []=(pos, value)
         @grid[pos[0]][pos[1]] = value
    end

    def num_ships
        count = 0
        @grid.each do |sub|
            sub.each do |ele|
                if ele == :S
                    count +=1
                end
            end
        end
        return count
    end


    def attack(pos)
        if self[pos] == :S
            self[pos]= :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
        # if @grid[pos[0]][pos[1]] == :S
        #     @grid[pos[0]][pos[1]] = :H
        #     puts "you sunk my battleship!"
        #     return true
        # else
        #     @grid[pos[0]][pos[1]] = :X
        #     return false
        # end

    end

    def place_random_ships
        amount = self.size * 0.25
        doneAlready = []
        amount.to_i.times do
            position = []
            until doneAlready.length == amount do
                 doneAlready.include?(position)
                position = []
                position << rand(0..(@grid.length-1))
                position << rand(0..(@grid.length-1))
                self[position] = :S
                if !doneAlready.include?(position)
                    doneAlready << position
                end
            end

        end
        
    end
end
