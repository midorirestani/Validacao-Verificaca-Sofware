
class PasswordVerifier 
    def self.check_password_length( password_string )
        password_string.length >= 8 ? true : false
    end

    def self.password_is_nil(password)
        password.length == 0? true : false
    end

    def self.contains_uppercase(password)
        (password =~ /[[:upper:]]/).nil? ? false : true
    end

    def self.contains_lowercase(password)
        (password =~ /[:lower:]/).nil? ? false :true
    end

    def self.contains_number(password)
        (password =~ /\d/).nil? ? false : true
    end
    
    def self.verify(password)
        requirements = 5
        errors = ["Password does not fulfil the requirements:"]
            if !check_password_length(password)
                errors << "need to have at least 8 caracters"
    
                requirements = requirements - 1
            end
            if password_is_nil(password)
                errors << "could not be nil"

                requirements = requirements - 1
            end
            if !contains_uppercase(password)
                errors << "should have at least one uppercase"

                requirements = requirements - 1
            end
            
            if !contains_number(password)
                errors << "should have at least one number"
                
                requirements = requirements - 1
            end     
            
            raise "must have at least one lowercase" if !contains_lowercase(password)
            raise errors.join("; ") if requirements < 3
    end
end
