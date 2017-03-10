require "coinone/account/account_info/bank_info"
require "coinone/account/account_info/email_info"
require "coinone/account/account_info/fee_rates"
require "coinone/account/account_info/virtual_account_info"
require "coinone/account/account_info/mobile_info"


module Coinone

  class Account

    class AccountInfo

      attr_reader :result
      attr_reader :security_level
      attr_reader :bank_info, :email_info, :fee_rate, :virtual_account_info, :mobile_info

      def initialize(options={})
        @result = options[:result] || nil
        @security_level = nil
        @bank_info = BankInfo.new()
        @email_info = EmailInfo.new()
        @fee_rate = FeeRates.new()
        @virtual_account_info = VirtualAccountInfo.new()
        @mobile_info = MobileInfo.new()
        update_user_info(options) if options.has_key? :userInfo
      end

      def update_user_info(params={})

        user_info = params[:userInfo]
        @security_level = user_info[:securityLevel].to_i
        bank_info = user_info[:bankInfo]
        email_info = user_info[:emailInfo]
        fee_rate = user_info[:feeRate]
        virtual_account_info = user_info[:virtualAccountInfo]
        mobile_info = user_info[:mobileInfo]


        @result = params[:result] if params.has_key? :result
        @bank_info.update_info(bank_info)
        @email_info.update_info(email_info)
        @fee_rate.update_info(fee_rate)
        @virtual_account_info.update_info(virtual_account_info)
        @mobile_info.update_info(mobile_info)


      end



    end
  end
end
