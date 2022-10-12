class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
        
    end

    def get_position
        newarr = []
        alpha = ("a".."z")

        puts "Please enter two numbers separated by a space. Ex: 4 6"
        answer = gets.chomp.split(" ")
        
        answer.each do |letter|
            if alpha.include?(letter.downcase)
                raise "only put numbers"
            end
        end

        newarr = answer.map { |ele| ele.to_i}
        if newarr.length != 2
            raise "error, only put two numbers with a space inbetween"
        end
      
        return newarr
    end

end