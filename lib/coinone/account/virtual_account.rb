module Coinone

  class Account

    class VirtualAccount

      attr_reader :result
      attr_reader :depositor, :account_number, :bank_name

      def initialize(options={})

        @result = options[:result] || nil
        @depositor = nil
        @account_number = nil
        @bank_name = nil

        update_virtual_account(options)

      end

      def update_virtual_account(params={})

        @result = params[:result] if params.has_key? :result
        @depositor = params[:depositor] if params.has_key? :depositor
        @account_number = params[:accountNumber] if params.has_key? :accountNumber
        @bank_name  = params[:bankName] if params.has_key? :bankName

      end



    end
  end
end
