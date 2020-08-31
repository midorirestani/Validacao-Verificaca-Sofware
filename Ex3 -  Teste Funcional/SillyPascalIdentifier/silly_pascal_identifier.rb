class SillyPascalIdentifier
    def self.is_valid?(identifier)
        id = identifier.to_s
        if id.nil? 
            return false
        elsif id.length == 0 || id.length > 6
             return false
        elsif !(id[0] =~ /[[:digit:]]/).nil? 
            return false
        elsif !(id =~ /[^[:alnum:]]/).nil? 
            return false 
        else 
            return true
        end
    end
end