require 'spec_helper'
require './PasswordVerifier/password_verifier.rb'
RSpec.describe PasswordVerifier do

    describe ".check_password_length" do
        context "when password length is less than 8" do
            password = "abcd123"

            it "returns false" do
                result = PasswordVerifier.check_password_length(password)
                
                expect(result).to be(false)
            end
        end

        context "when password length is equal or more than 8" do
            password = "abcd1234abc"

            it "returns true" do
                result = PasswordVerifier.check_password_length(password)

                expect(result).to be(true)
            end
        end
    end

    describe ".password_is_nil" do
        context "when password is nil" do
            password = ""
            it "returns true" do

                result = PasswordVerifier.password_is_nil(password)

                expect(result).to be(true)
            end
        end

        context "when password is not nil" do
            password = "bresA1as3f"

            it "returns false" do
                result = PasswordVerifier.password_is_nil(password)

                expect(result).to be(false)
            end
        end
    end

    describe ".contains_uppercase" do
        context "when password does not contain uppercase" do
            password = "teste1234"

            it "returns false" do
                result = PasswordVerifier.contains_uppercase(password)
    
                expect(result).to  be(false) 
            end
        end
        context "when password contains one uppercase at least" do
            password = "Teste1234"

            it "returns true" do
                result = PasswordVerifier.contains_uppercase(password)
                
                expect(result).to  be(true) 
            end
            
        end
        
    end

    describe ".contains_lowercase" do
        context "when password does not contain lowercase" do
            password = "TESTE1234"

            it "returns false" do
                result = PasswordVerifier.contains_lowercase(password)
    
                expect(result).to  be(false) 
            end
        end

        context "when password contains lowercase" do
            password = "Teste1234"

            it "returns false" do
                result = PasswordVerifier.contains_lowercase(password)
    
                expect(result).to  be(true) 
            end
        end
    end
    describe ".contains_number" do
        context "when password does not contain number" do
            password = "TESTEasber"

            it "returns false" do
                result = PasswordVerifier.contains_number(password)
    
                expect(result).to  be(false) 
            end
        end

        context "when password contains number" do
            password = "Teste1234"

            it "returns false" do
                result = PasswordVerifier.contains_number(password)
    
                expect(result).to  be(true) 
            end
        end
    end
    

    describe ".verify" do
        context "when password fulfil all requirements" do

            it "does not raise error" do
                password = "Teste1234"
                
                expect{PasswordVerifier.verify(password)}.not_to raise_error
            end
        end

        context "when password fulfil at least 3 requirements, that includes the lowercase requirement" do
            it "does not raise error" do
                password = "teste1234"
                
                expect{PasswordVerifier.verify(password)}.not_to raise_error
            end
        end
        
        context "when password fulfil at least 3 requirements, but does not include the lowercase requirement" do
            it "does not raise error" do
                password = "TESTE1"
                
                expect{PasswordVerifier.verify(password)}.to raise_error
            end
        end
        
    end
    
end