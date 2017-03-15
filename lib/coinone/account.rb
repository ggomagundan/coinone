require "coinone/account/account_info"
require "coinone/account/balance"
require "coinone/account/daily_balance"
require "coinone/account/deposit_address"

module Coinone

  class Account

    attr_reader :connection
    attr_reader :account_info, :balance, :daily_balance, :deposit_address

    def initialize(options={}, connection=nil)

      @connection = connection || Connection.factory(options)
      @account_info = AccountInfo.new()
      @balance = Balance.new()
      @daily_balance = DailyBalance.new()
      @deposit_address = DepositAddress.new()

    end


    def get_user_info
      response = @connection.post( "/v2/account/user_info/")

      @account_info.update_user_info(response)
      @account_info

    end

    def get_balance

      response = @connection.post("/v2/account/balance/")

      @balance.update_balance(response)
      @balance

    end

    def get_daily_balance(options={})

      response = @connection.post("/v2/account/daily_balance/", options)

      @daily_balance.update_balance(response)
      @daily_balance

    end

    def get_deposit_address

      response = @connection.post("/v2/account/deposit_address/")

      @deposit_address.update_address(response)
      @deposit_address

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
