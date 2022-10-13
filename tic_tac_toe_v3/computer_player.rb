

class ComputerPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
        
    end

    def get_position(positions)
        pos = rand(0...positions.length)
        puts "Computer chose position #{positions[pos]}"
        return positions[pos]
    end
end