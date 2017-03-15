require 'coinone/transaction/coin_history/history'

module Coinone

  class Transaction

    class CoinHistory

      attr_reader :result
      attr_reader :histories

      def initialize(options={})

        @result = options[:result] || nil
        @histories = []

        update_histories(options)


      end

      def update_histories(params={})

        @result = params[:result] if params.has_key? :result
        if !params[:transactions].nil?
          @histories = []
          params[:transactions].each do |transaction|
            @histories.push(History.new(transaction))
          end
        end

      end

    end
  end
end
