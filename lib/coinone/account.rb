require "coinone/account/bank_info"
require "coinone/account/email_info"
require "coinone/account/fee_rate"
require "coinone/account/virtual_account_info"
require "coinone/account/mobile_info"

module Coinone

  class Account

    attr_reader :security_level
    attr_reader :connection
    attr_reader :bank_info, :email_info, :fee_rate, :virtual_account_info, :mobile_info

    def initialize(options={}, connection=nil)
      @connection = connection || Connection.factory(options)
      @security_level = nil
      @bank_info = BankInfo.new()
      @email_info = EmailInfo.new()
      @fee_rate = FeeRate.new()
      @virtual_account_info = VirtualAccountInfo.new()
      @mobile_info = MobileInfo.new()
    end


    def get_user_info
      res = @connection.post( "/account/user_info/")

      @connection.check_for_errors(res.body)

      puts res.body

      set_user_info(res.body)
    end

    def set_user_info(params={})
      json = JSON.parse(params, :symbolize_names => true)

      user_info = json[:userInfo]
      @security_level = user_info[:securityLevel].to_i
      bank_info = user_info[:bankInfo]
      email_info = user_info[:emailInfo]
      fee_rate = user_info[:feeRate]
      virtual_account_info = user_info[:virtualAccountInfo]
      mobile_info = user_info[:mobileInfo]

      @bank_info.update_info(bank_info)
      @email_info.update_info(email_info)
      @fee_rate.update_info(fee_rate)
      @virtual_account_info.update_info(virtual_account_info)
      @mobile_info.update_info(mobile_info)


    end

=begin
    def security_level
      return @security_level
    end

    def security_level=(new_security_level)
      @security_level = new_security_level
    end
=end


  end
end
