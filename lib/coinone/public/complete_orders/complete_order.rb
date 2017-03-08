module Coinone

  module Public
    class CompleteOrders
      class CompleteOrder
        attr_reader :price, :qty, :timestamp

        def initialize(params={})
          @price = params[:price].to_i || nil
          @qty = params[:qty].to_f || nil
          @timestamp = params[:timestamp].to_i || nil
        end
      end

    end
  end

end
