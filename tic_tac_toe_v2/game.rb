require_relative "./board.rb"
require_relative "human_player.rb"
$count = 0
$newarr = []
class Game
  
    attr_reader :currentplayer, :player_1_mark, :player_2_mark, :board

    def initialize(n, *playermark)
        @board = Board.new(n)
        $newarr = []
        playermark.each do |player|
            $newarr << HumanPlayer.new(player)
            
        end
        
        @currentplayer = $newarr[0]
        
    end

    def switch_turn
        divisor = $newarr.length
        $count += 1
        @currentplayer = $newarr[($count % divisor)]
        
        puts
        puts "#{currentplayer.mark} it is your turn"
        puts
        # # if $count % 2 == 1
        # #     $count += 1
        # #     @currentplayer = @player2
        # #     puts "#{currentplayer.mark} it is your turn"
        # #     puts
        # # else
        # #     $count += 1
        # #     @currentplayer = @player1
        # #     puts "#{currentplayer.mark} it is your turn"
        # #     puts
        # end


    end

    def play
        while @board.empty_positions?
            @board.print
            position = @currentplayer.get_position
            @board.place_mark(position, @currentplayer.mark)
            if @board.win?(@currentplayer.mark)
                puts "Victory to #{@currentplayer.mark}!!"
                return 
            else
                self.switch_turn
            end

        end
        puts "It was a draw"
    end


end