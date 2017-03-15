
module Coinone

  class Order

    class LimitOrders
      class LimitOrder

        attr_reader :index, :timestamp, :price, :type, :qty, :fee_rate, :order_id

        def initialize(options={})

          @index = nil
          @timestamp = nil
          @price = nil
          @type = nil
          @qty = nil
          @fee_rate = nil
          @order_id = nil

          update_response(options)


        end

        def update_response(params={})


          @index = params[:index].to_i if params.has_key? :index
          @timestamp = params[:timestamp].to_i if params.has_key? :timestamp
          @price = params[:price].to_i if params.has_key? :price
          @qty = params[:qty].to_f if params.has_key? :qty
          @order_id = params[:orderId] if params.has_key? :orderId
          @type = params[:type] if params.has_key? :type
          @fee_rate = params[:feeRate].to_f if params.has_key? :feeRate

        end

      end
    end
  end
end
