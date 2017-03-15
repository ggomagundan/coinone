
module Coinone

  class Order

    class CompleteOrders
      class CompleteOrder

        attr_reader :timestamp, :price, :type, :qty, :fee_rate, :fee, :order_id

        def initialize(options={})

          @timestamp = nil
          @price = nil
          @type = nil
          @qty = nil
          @fee_rate = nil
          @fee = nil
          @order_id = nil


          update_response(options)


        end

        def update_response(params={})

          @timestamp = params[:timestamp].to_i if params.has_key? :timestamp
          @price = params[:price].to_i if params.has_key? :price
          @qty = params[:qty].to_f if params.has_key? :qty
          @type = params[:type] if params.has_key? :type
          @fee_rate = params[:feeRate].to_f if params.has_key? :feeRate
          @fee = params[:fee].to_f if params.has_key? :fee
          @order_id = params[:orderId] if params.has_key? :orderId

        end

      end
    end
  end
end
