module Coinone

  module Public
    class Orderbook
      class Order
        attr_reader :price, :qty

        def initialize(params={})
          @price = params[:price].to_i || nil
          @qty = params[:qty].to_f || nil
        end
      end

    end
  end

end
