require 'coinone/order/cancel_all_order_response'
require 'coinone/order/cancel_order_response'
require 'coinone/order/trade_response'
require 'coinone/order/complete_orders'
require 'coinone/order/limit_orders'

module Coinone

  class Order

    attr_reader :connection
    attr_reader :cancel_all_order_response, :cancel_order_response, :limit_sell, :limit_buy
    attr_reader :market_buy, :market_sell, :complete_orders, :limit_orders


    def initialize(options={}, connection=nil)

      @connection = connection || Connection.factory(options)
      @cancel_all_order_response = CancelAllOrderResponse.new()
      @cancel_order_response = CancelOrderResponse.new()
      @limit_sell = TradeResponse.new()
      @limit_buy = TradeResponse.new()
      @market_sell = TradeResponse.new()
      @market_buy = TradeResponse.new()
      @complete_orders = CompleteOrders.new()
      @limit_orders = LimitOrders.new()

    end


    def cancel_all_order(options={})
      options[:currency] = "btc" if options[:currency].blank?
      response = @connection.post( "/v2/order/cancel_all/", options)

      @cancel_all_order_response.update_response(response)
      @cancel_all_order_response

    end

    def cancel_order(options={})
      options[:currency] = "btc" if options[:currency].blank?
      response = @connection.post( "/v2/order/cancel/", options)

      @cancel_order_response.update_response(response)
      @cancel_order_response

    end

    def get_limit_sell(options={})

      options[:currency] = "btc" if options[:currency].blank?
      response = @connection.post( "/v2/order/limit_sell/", options)

      @limit_sell.update_response(response)
      @limit_sell
    end

    def get_limit_buy(options = {})
      options[:currency] = "btc" if options[:currency].blank?
      response = @connection.post( "/v2/order/limit_buy/", options)

      @limit_buy.update_response(response)
      @limit_buy

    end

    def get_market_buy(options={})
      options[:currency] = "btc" if options[:currency].blank?
      response = @connection.post( "/v2/order/market_buy/", options)

      @market_buy.update_response(response)
      @market_buy

    end

    def get_market_sell(options={})
      options[:currency] = "btc" if options[:currency].blank?
      response = @connection.post( "/v2/order/market_sell/", options)

      @market_sell.update_response(response)
      @market_sell

    end

    def get_complete_orders(options={})
      options[:currency] = "btc" if options[:currency].blank?
      response = @connection.post( "/v2/order/complete_orders/", options)

      @complete_orders.update_response(response)
      @complete_orders


    end


    def get_limit_orders(options={})
      options[:currency] = "btc" if options[:currency].blank?
      response = @connection.post( "/v2/order/limit_orders/", options)

      @limit_orders.update_response(response)
      @limit_orders

    end

  end
end
