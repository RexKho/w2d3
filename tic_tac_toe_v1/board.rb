class Board
    def initialize(n)
        @grid = Array.new(3) {Array.new(3, :_)}
    end

    def valid?(position)
        if (position[0] < @grid.length) && (position[1] < @grid.length)
            return true
        else 
            return false
        end
    end

    def empty?(position)
        if @grid[position[0]][position[1]] == :_
            return true
        else
            return false
        end
    end

    def place_mark(position, mark)
        if self.empty?(position) && self.valid?(position)
            @grid[position[0]][position[1]] = mark
        else
            raise "error"
        end
    end


    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            if row.all? {|ele| ele == mark}
                return true
            end
        end
        return false
    end
    
    def win_col?(mark)
        @grid.length.times do |rownum|
            newarr = []
            @grid.length.times do |idx|
                newarr << @grid[idx][rownum]
            end
            if newarr.all? {|ele| ele == mark}
                return true
            end
        end
        return false
       
    end

    def win_diagonal?(mark)
        newarr = []
        @grid.length.times do |num1|
            newarr << @grid[num1][num1]
        end
        if newarr.all? {|ele| ele == mark}
            return true
        end
        newarr = []
        i = @grid.length-1
        @grid.length.times do |num1|
            newarr << @grid[num1][i]
            i -= 1
        end
        if newarr.all? {|ele| ele == mark}
            return true
        end
        return false
    end

    def win?(mark)
        if self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
            return true
        else
            return false
        end
    end

    def empty_positions?
        @grid.each do |row|
            row.each do |ele|
                if ele == :_
                    return true
                end
            end
        end
        return false
    end
    
end