require 'coinone/public/orderbook/orders'
module Coinone

  module Public
    class Orderbook
      attr_reader :ask, :bid, :timestamp, :currency

      def initialize(params={})
        @ask = Orders.new(params[:ask]) || []
        @bid = Orders.new(params[:bid]) || []
        @timestamp = params[:timestamp].to_i || nil
        @currency= params[:currency] || nil
      end

    end
  end

end
