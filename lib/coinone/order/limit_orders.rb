require 'coinone/order/limit_orders/limit_order'

module Coinone

  class Order

    class LimitOrders

      attr_reader :result
      attr_reader :complete_orders

      def initialize(options={})

        @result = options[:result] || nil
        @limit_orders = []

        update_response(options)


      end

      def update_response(params={})

        @result = params[:result] if params.has_key? :result
        if params[:limitOrders].present?
          @limit_orders = []
          params[:limitOrders].each do |limit_order|
            @limit_orders.push(LimitOrder.new(limit_order))
          end
        end

      end

    end
  end
end
