class CalculaIR
    def self.calcula_ir(salario)
        ret = 0.0
        if(salario > 1000 && salario <=2000)
            ret = ret + (salario - 1000.0)*(0.15)
        end
        if(salario > 2000)
            ret = ret + 150 + (salario-2000.0)*(0.20)
        end
        if(salario > 3000)
            ret = ret + (salario-3000.0)*(0.05)
        end

        return ret
    end
end