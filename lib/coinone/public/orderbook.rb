require 'coinone/public/orderbook/order'
module Coinone

  module Public
    class Orderbook
      attr_reader :result
      attr_reader :ask, :bid, :timestamp, :currency

      def initialize(params={})
        @result = params[:result] || nil
        @ask = []
        @bid = []
        @timestamp = params[:timestamp].to_i || nil
        @currency= params[:currency] || nil
        push_orders(params[:ask], @ask) if params.has_key? :ask
        push_orders(params[:bid], @bid) if params.has_key? :bid
      end

      def push_orders(params, orders)
        orders.clear
        params.each do |order|
          orders.push(Order.new(order))
        end
      end



    end
  end

end
