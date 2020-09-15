require 'spec_helper'
require './CalculaIR/calcula_ir.rb'

describe "#calcula_ir" do
    context "when salario is less or equal 1000" do
        it "returns 0.0" do
            salario = 950.0
            result = CalculaIR.calcula_ir(salario)

            expect(result).to eq(0.0)
        end
    end

    context "when salario is greater than 1000 and less or equal 2000" do
        it "returns (salario-1000)*(0.15)" do
            salario = 1500.0
            expected_result = (salario-1000)*(0.15)
            result = CalculaIR.calcula_ir(salario)

            expect(result).to eq(expected_result)
        end
    end

    context "when salario is greater than 2000 and less or equal 3000" do
        it "returns 150+(salario-2000)*(0.20)" do
            salario = 2670.0
            expected_result = 150+(salario-2000)*(0.20)
            result = CalculaIR.calcula_ir(salario)

            expect(result).to eq(expected_result)
        end
    end

    context "when salario is greater than 3000" do
        it "returns (0.25*salario)-400" do
            salario = 3675
            expected_result = (0.25*salario)-400.0
            result = CalculaIR.calcula_ir(salario)

            expect(result).to eq(expected_result)
        end
    end
end
