require 'coinone/account/daily_balance/balance'

module Coinone

  class Account

    class DailyBalance

      attr_reader :result
      attr_reader :daily_balances

      def initialize(options={})

        @result = options[:result] || nil
        @daily_balances = []

        update_balance(options) if options.has_key? :dailyBalance


      end

      def update_balance(params={})

        @result = params[:result] if params.has_key? :result
        if params.has_key? :dailyBalance
          @daily_balances.clear
          params[:dailyBalance].each do |balance|
            @daily_balances.push(Balance.new(balance))
          end
        end
      end



    end
  end
end
