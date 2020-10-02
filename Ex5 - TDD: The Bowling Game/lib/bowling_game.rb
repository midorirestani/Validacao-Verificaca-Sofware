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
            if is_strike?(frame_index)
                score += (10 + strike_bonus(frame_index))
                frame_index += 1
            elsif is_spare?(frame_index)
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

    def is_strike?(frame_index)
        return @rolls[frame_index] == 10
    end

    def spare_bonus(frame_index)
        return @rolls[frame_index+2]
    end

    def strike_bonus(frame_index)
        return (@rolls[frame_index+1]+@rolls[frame_index+2])
    end

end
