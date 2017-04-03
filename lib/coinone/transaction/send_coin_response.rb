
module Coinone

  class Transaction

    class SendCoinResponse

      attr_reader :result
      attr_reader :txid, :currency

      def initialize(options={})

        @result = options[:result] || nil
        @txid = nil
        @currency = options[:currency] || nil

        update_response(options)


      end

      def update_response(params={})

        @result = params[:result] if params.has_key? :result
        @txid = params[:txid] if params.has_key? :txid
        @currency = params[:currency].downcase if params.has_key? :currency

      end

      def transaction_url

        url = nil
        url = "https://blockchain.info/tx/#{txid}" if @currency == "btc"
        url = "https://etherscan.io/tx/#{txid}" if @currency == "eth"
        url = "https://gastracker.io/tx/#{txid}" if @currency == "etc"

        url
      end

    end
  end
end
