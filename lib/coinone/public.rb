require 'coinone/public/currency'
require 'coinone/public/orderbook'
require 'coinone/public/complete_orders'
require 'coinone/public/tickers'

module Coinone

  module Public

     attr_reader :currency, :orderbook, :complete_orders, :ticker

     def get_currency(options={}, connection=nil)
      @connection = connection || Connection.factory(options)
      response = @connection.get("/currency")

      puts response

      @currency = Currency.new(response)

     end

     def get_orderbook(options={}, connection=nil)
      @connection = connection || Connection.factory(options)
      response = @connection.get("/orderbook", options)

      puts response

      @orderbook = Orderbook.new(response)

     end

     def get_complete_orders(options={}, connection=nil)
      @connection = connection || Connection.factory(options)
      response = @connection.get("/trades", options)

      puts response

      @complete_orders = CompleteOrders.new(response)
     end


     def get_ticker(options={}, connection=nil)
      @connection = connection || Connection.factory(options)
      response = @connection.get("/ticker", options)

      puts response

      @ticker = Tickers.new(response)


     end

     module_function :get_currency, :get_orderbook, :get_complete_orders, :get_ticker

  end

end
