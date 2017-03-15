require 'coinone/order/complete_orders/complete_order'
module Coinone

  class Order

    class CompleteOrders

      attr_reader :result
      attr_reader :complete_orders

      def initialize(options={})

        @result = options[:result] || nil
        @complete_orders = []

        update_response(options)


      end

      def update_response(params={})

        @result = params[:result] if params.has_key? :result
        if !params[:completeOrders].nil?
          @complete_orders = []
          params[:completeOrders].each do |complete_order|
            @complete_orders.push(CompleteOrder.new(complete_order))
          end
        end

      end

    end
  end
end
