
module Coinone

  class Order

    class CancelAllOrderResponse

      attr_reader :result
      attr_reader :success_canceled_orders, :overall_orders

      def initialize(options={})

        @result = options[:result] || nil
        @success_canceled_orders = nil
        @overall_orders = nil

        update_response(options)


      end

      def update_response(params={})

        @result = params[:result] if params.has_key? :result
        @success_canceled_orders = params[:successCanceledOrders] if params.has_key? :successCanceledOrders
        @overall_orders = params[:overallOrders] if params.has_key? :overallOrders

      end

    end
  end
end
