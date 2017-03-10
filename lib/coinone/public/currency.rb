module Coinone

  module Public
    class Currency
      attr_reader :result
      attr_reader :currency, :source, :currency_type

      def initialize(params={})
        @result = params[:result] || nil
        @currency = params[:currency].to_f || nil
        @source = params[:source] || nil
        @currency_type = params[:currencyType] || nil
      end

    end
  end

end
