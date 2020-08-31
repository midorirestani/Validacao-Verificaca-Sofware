require 'spec_helper'
require './SillyPascalIdentifier/silly_pascal_identifier.rb'

=begin
Conditions:                         |    Valid    |      Invalid        |
1) identifier length (L)            | 0 < L <= 6  | L = 0 or nil, L > 6 |
2) starts with letter               |     YES     |         NO          |
3) not contain special characters   |     YES     |         NO         |

[length]-----------------------------------------------------------------
(nil, false) L = nil
("", false) L = 0
("abcd123", false) L > 6

[starts with letter]----------------------------------------------------
("987a654", false) - string doesn't start with letter

[not contain special characters]----------------------------------------
("a1b@c", false) - string contain special character

[valid string]----------------------------------------------------------
("vvs120", true)

=end
    
RSpec.describe SillyPascalIdentifier do
    describe ".is_valid" do
        context "invalid cases:" do
            context "when identifier is nil" do
                id = nil

                it "returns false" do
                    result = SillyPascalIdentifier.is_valid?(id)
                    expect(result).to be(false)
                end
            end

            context "when identifier length is 0" do
                id = ""

                it "returns false" do
                    result = SillyPascalIdentifier.is_valid?(id)
                    expect(result).to be(false)
                end             
            end

            context "when identifier length is longer than 6" do
                id = "abcd123"

                it "returns false" do
                    result = SillyPascalIdentifier.is_valid?(id)
                    expect(result).to be(false)
                end             
            end
            context "when identifier does not start with letter" do
                id = "987a654"

                it "returns false" do
                    result = SillyPascalIdentifier.is_valid?(id)
                    expect(result).to be(false)
                end
            end
            
            
            context "when identifier contains special characters" do
                id = "a1b@c"

                it "returns false" do
                    result = SillyPascalIdentifier.is_valid?(id)
                    expect(result).to be(false)
                end
            end
        end
        context "when identifer respects all criteria" do
            id = "vvs120"
            
            it "returns true" do
                result = SillyPascalIdentifier.is_valid?(id)
                expect(result).to be(true)
            end
        end
    end
end
