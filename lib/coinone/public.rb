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

      @currency = Currency.new(response)
      @currency

     end

     def get_orderbook(options={}, connection=nil)
      @connection = connection || Connection.factory(options)
      response = @connection.get("/orderbook", options)

      @orderbook = Orderbook.new(response)
      @orderbook

     end

     def get_complete_orders(options={}, connection=nil)
      @connection = connection || Connection.factory(options)
      response = @connection.get("/trades", options)

      @complete_orders = CompleteOrders.new(response)
      @complete_orders
     end


     def get_ticker(options={}, connection=nil)
      @connection = connection || Connection.factory(options)
      response = @connection.get("/ticker", options)


      @ticker = Tickers.new(response)
      @ticker


     end

     module_function :get_currency, :get_orderbook, :get_complete_orders, :get_ticker

  end

end
