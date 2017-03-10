require "coinone/account/account_info"
require "coinone/account/balance"

module Coinone

  class Account

    attr_reader :connection
    attr_reader :account_info, :balance

    def initialize(options={}, connection=nil)

      @connection = connection || Connection.factory(options)
      @account_info = AccountInfo.new()
      @balance = Balance.new()

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
