require 'coinone/public/complete_orders/complete_order'
module Coinone

  module Public
    class CompleteOrders
      attr_reader :orders, :timestamp, :currency

      def initialize(params={})
        @orders = []
        @timestamp = params[:timestamp] || nil
        @currency= params[:currency] || nil
        push_orders(params[:completeOrders]) if params.has_key? :completeOrders
      end

      def push_orders(params)
        params.each do |order|
          @orders.push(CompleteOrder.new(order))
        end
      end

    end
  end

end
