module Coinone

  module Public
    class Currency
      attr_reader :currency, :source, :currency_type

      def initialize(params={})
        @currency = params[:currency].to_f || nil
        @source = params[:source] || nil
        @currency_type = params[:currencyType] || nil
      end

    end
  end

end
