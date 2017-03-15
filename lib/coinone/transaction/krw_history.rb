require 'coinone/transaction/krw_history/history'

module Coinone

  class Transaction

    class KrwHistory

      attr_reader :result
      attr_reader :histories

      def initialize(options={})

        @result = options[:result] || nil
        @histories = []

        update_histories(options)


      end

      def update_histories(params={})

        @result = params[:result] if params.has_key? :result
        if !params[:krwHistory].nil?
          @histories = []
          params[:krwHistory].each do |history|
            @histories.push(History.new(history))
          end
        end

      end

    end
  end
end
