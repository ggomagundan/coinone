require "coinone/account/account_info/fee_rates/fee_rate"
module Coinone

  class Account
    class AccountInfo
      class FeeRates
        attr_reader :btc, :eth, :etc

        def initialize(params={})
          @btc = FeeRate.new()
          @eth = FeeRate.new()
          @etc = FeeRate.new()
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
end


