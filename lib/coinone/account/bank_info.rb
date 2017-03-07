module Coinone

  class Account
    class BankInfo
      attr_reader :depositor, :bank_code, :is_authenticated, :account_number

      def initialize(params={})

        @depositor = nil
        @bank_code = nil
        @is_authenticated = nil
        @account_number = nil

        update_info(params)
      end

      def update_info(params={})

        @depositor = params[:depositor].strip if params.has_key? :depositor
        @bank_code = params[:bankCode].strip if params.has_key? :bankCode
        @is_authenticated = params[:isAuthenticated] == "true"
        @account_number = params[:accountNumber].strip if params.has_key? :accountNumber

      end
    end

  end
end


