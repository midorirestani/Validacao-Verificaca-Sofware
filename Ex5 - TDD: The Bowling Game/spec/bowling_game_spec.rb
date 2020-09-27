require 'spec_helper'
require_relative '../lib/bowling_game.rb'

RSpec.describe BowlingGame do
    describe "The Bowling Game" do
        before(:each) do
            @bowling_game = BowlingGame.new
        end

       context "when player got a gutter Game" do

           it "should score 0" do
               expect(@bowling_game.score()).to be(0)
           end
       end
       
    end
end