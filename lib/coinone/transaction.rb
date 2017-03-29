require 'coinone/transaction/auth_number_response'
require 'coinone/transaction/coin_history'
require 'coinone/transaction/krw_history'
require 'coinone/transaction/send_coin_response'

module Coinone

  class Transaction

    attr_reader :connection
    attr_reader :auth_number_response, :coin_history, :krw_history, :send_coin_response

    def initialize(options={}, connection=nil)

      @connection = connection || Connection.factory(options)
      @auth_number_response = AuthNumberResponse.new()
      @coin_history = CoinHistory.new()
      @krw_history = KrwHistory.new()
      @send_coin_response = SendCoinResponse.new()

    end


    def get_auth_number(options={})
      response = @connection.post( "/v2/transaction/auth_number/", options)

      @auth_number_response.update_response(response)
      @auth_number_response

    end

    def get_coin_history(options={})

      response = @connection.post("/v2/transaction/history/", options)

      @coin_history.update_histories(response)
      @coin_history

    end

    def get_krw_history(options={})

      response = @connection.post("/v2/transaction/krw/history/", options)

      @krw_history.update_histories(response)
      @krw_history

    end

    def send_coin(options={})

      response = @connection.post("/v2/transaction/coin/", options)
      #response = {txid: "Txid"}

      @send_coin_response.update_response(response.merge({ currency: options[:currency]}))
      @send_coin_response

    end
  end
end
