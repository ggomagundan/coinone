require 'coinone/public/tickers/ticker'
module Coinone

  module Public
    class Tickers
      attr_reader :result
      attr_reader :timestamp, :tickers

      def initialize(params={})
        @result = params[:result] || nil
        @result = params[:timestamp] || nil
        @tickers = []
        push_tickers(params)
      end

      def push_tickers(params)
        @tickers.clear
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
