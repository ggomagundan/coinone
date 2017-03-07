require "coinone/account/fee_rate/btc"
require "coinone/account/fee_rate/eth"
require "coinone/account/fee_rate/etc"
module Coinone

  class Account
    class FeeRate
      attr_reader :btc, :eth, :etc

      def initialize(params={})
        @btc = Btc.new()
        @eth = Eth.new()
        @etc = Etc.new()
        update_info(params)
      end

      def update_info(params={})
        @btc.update_info(params[:btc]) if params.has_key? :btc
        @eth.update_info(params[:eth]) if params.has_key? :eth
        @etc.update_info(params[:etc]) if params.has_key? :etc
      end
    end

  end
end


