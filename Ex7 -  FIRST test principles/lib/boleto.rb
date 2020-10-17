require 'active_support/all'
require 'cpf_utils'

class Boleto
    attr_accessor  :value,
                   :cpf,
                   :name,
                   :expiration_date
                    
    def initialize(value, name, cpf)
        @value = value
        @name = assign_name(name)
        @cpf =  validate_assign(cpf)
    end

    def self.next_business_day
        tomorrow = Time.current.tomorrow.noon
        next_monday = Time.current.next_week.monday.noon
        tomorrow.wday.between?(1, 5) ? @expiration_date = tomorrow :  @expiration_date = next_monday
        return @expiration_date
    end

    def self.next_month_business_day(expiration_date)
        next_month = expiration_date.next_month.noon
        next_month_monday = expiration_date.next_month.next_week.monday.noon
        next_month.wday.between?(1,5) ? next_month : next_month_monday
    end

    def self.validate_and_assign_cpf(cpf)

        if CpfUtils.valid_cpf?(cpf)
            @cpf = cpf.to_cpf_format
        else
            raise "O CPF é inválido"
        end
    end

    def self.assign_name(name)
        if !name.nil? or name.length > 0
            @name = name
        else
            raise "Nome inválido"
        end
    end
end