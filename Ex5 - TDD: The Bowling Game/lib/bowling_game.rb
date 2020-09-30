require 'enumerator'
class BowlingGame

    def initialize()
        @rolls = Array.new(21, 0)
        @actual_roll = 0

    end
    
    def roll(value)
        @rolls[@actual_roll] = value
        @actual_roll += 1
    end

    def get_score
        score = 0
        frame_index =0

        for frame in 0..9
                if is_spare?(frame_index)
                    puts "is spare"
                    score +=  (10 + spare_bonus(frame_index))
                    frame_index += 2
                else
                    score +=  (@rolls[frame_index] + @rolls[frame_index+1])
                    frame_index += 2
                end
            end
        return score
    end

    def is_spare?(frame_index)
        return (@rolls[frame_index]+@rolls[frame_index+1]) == 10
    end

    def spare_bonus(frame_index)
        return @rolls[frame_index+2]
    end

    def print_rolls
        for i in 0..@rolls.length
            print "#{@rolls[i]} "
        end
        puts
    end
end
