require 'coinone/public/tickers/ticker'
module Coinone

  module Public
    class Tickers
      attr_reader :tickers

      def initialize(params={})
        @tickers = []
        push_tickers(params)
      end

      def push_tickers(params)
        currency_list = [:btc, :eth, :etc]
        currency_list.each do |currency|
          if params.has_key? currency
            @tickers.push(Ticker.new(params[currency]))
          end
        end
        @tickers.push(Ticker.new(params)) if params.has_key? :currency
      end

    end
  end

end
