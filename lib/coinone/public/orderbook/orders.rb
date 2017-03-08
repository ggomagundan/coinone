require 'coinone/public/orderbook/order'
module Coinone

  module Public
    class Orderbook
      class Orders
        attr_reader :order_list

        def initialize(params={})
          @order_list = []
          push_orders(params)
        end

        def push_orders(params)
          params.each do |order|
            @order_list.push(Order.new(order))
          end
        end

      end

    end
  end

end
