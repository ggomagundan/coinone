module Coinone

  class Account
    class AccountInfo
      class VirtualAccountInfo
        attr_reader :depositor, :account_number, :bank_name

        def initialize(params={})
          @depositor = nil
          @account_number = nil
          @bank_name = nil
          update_info(params)
        end

        def update_info(params={})
          @depositor = params[:depositor].strip if params.has_key? :depositor
          @account_number = params[:accountNumber].strip if params.has_key? :accountNumber
          @bank_name = params[:bankName].strip if params.has_key? :bankName
        end
      end

    end
  end
end

