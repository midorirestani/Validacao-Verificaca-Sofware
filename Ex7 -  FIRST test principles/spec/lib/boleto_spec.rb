require 'spec_helper'
require 'active_support/all'
require_relative '../../lib/boleto.rb'

RSpec.describe Boleto do
    context "describe methods" do
        let!(:today){Time.now}
        next_business_day = nil

        context ".next_business_day" do
            it "returns next monday when date is friday or weekend and returns next day if not" do
                next_business_day = Boleto.next_business_day
                if today.wday.between?(0,4)
                    expect(next_business_day).to eq(Time.current.tomorrow.noon)
                else
                    expect(next_business_day).to eq(Time.current.next_week.monday.noon)
                end
            end 
        end

        context ".next_month_business_day" do
            it "returns next month same date when date is not friday or weekend and returns next monday from same date in next month if is" do
                next_month_business_day = Boleto.next_month_business_day(next_business_day)
                if next_business_day.wday.between?(0,4)
                    expect(next_month_business_day).to eq(next_business_day.next_month.noon)
                else
                    expect(next_month_business_day).to eq(next_business_day.next_month.next_week.monday.noon)
                end
            end
        end
        
        context ".assign_name" do
            let!(:boleto){ Boleto.new }

            it "assign a name to the boleto" do
                boleto.assign_name("Gabriela")
            end
        end

        context ".validate_and_assign_cpf" do
            let!(:boleto){ Boleto.new }
            context "when invalid cpf" do
                let!(:cpf){ "111.111.111-11" }
                it "assign a cpf to the boleto" do
                    boleto.validate_and_assign_cpf(cpf)
                end
            end
        end
    end
end
