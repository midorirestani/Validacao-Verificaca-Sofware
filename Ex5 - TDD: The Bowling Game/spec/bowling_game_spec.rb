require 'spec_helper'
require_relative '../lib/bowling_game.rb'

RSpec.describe BowlingGame do
    describe "The Bowling Game" do
        before(:each) do
            @bowling_game = BowlingGame.new
        end

        context "gutter game" do
            it "returns score equals 0" do
                expect(@bowling_game.get_score).to be(0)
            end
        end
        
        context "all ones" do
            it "returns score equals 20" do
               roll_many(19, 1)
                expect(@bowling_game.get_score).to be(20)
            end
        end

        context "one spare test" do
            it "returns score equals 10 + next roll" do
                @bowling_game.roll(7)
                @bowling_game.roll(3)
                @bowling_game.roll(5)

                expect(@bowling_game.get_score).to be(20)
            end
        end
    end

    def roll_many(n, pins)
        for i in 0..n
            @bowling_game.roll(pins)
        end
    end
end