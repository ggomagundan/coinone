
module Coinone

  class Transaction

    class CoinHistory

      class History

        attr_reader :txid, :type, :from, :to, :confirmations, :quantity, :timestamp

        def initialize(options={})

          @txid = nil
          @type = nil
          @from = nil
          @to = nil
          @confirmations = nil
          @quantity = nil
          @timestamp = nil

          update_history(options)

        end

        def update_history(params={})


          @txid = params[:txid] if params.has_key? :txid
          @type = params[:type] if params.has_key? :type
          @from = params[:from] if params.has_key? :from
          @to = params[:to] if params.has_key? :to
          @confirmations = params[:confirmations].to_i if params.has_key? :confirmations
          @quantity = params[:quantity].to_f if params.has_key? :quantity
          @timestamp = params[:timestamp].to_i if params.has_key? :timestamp

        end
      end

    end
  end
end
