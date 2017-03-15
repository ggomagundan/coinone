require 'coinone/account/deposit_address/wallet'
module Coinone

  class Account

    class DepositAddress

      attr_reader :result
      attr_reader :btc, :eth, :etc

      def initialize(options={})

        @result = options[:result] || nil
        @btc = Wallet.new()
        @eth = Wallet.new()
        @etc = Wallet.new()
        @xrp = Wallet.new()

        update_address(options)

      end

      def update_address(params={})

        @result = params[:result] if params.has_key? :result
        if params.has_key? :walletAddress
          address = params[:walletAddress]
          @btc.update_address(address) if address.has_key? :btc
          @eth.update_address(address) if address.has_key? :eth
          @etc.update_address(address) if address.has_key? :etc
          @xrp.update_address(address) if address.has_key? :xrp
        end

      end



    end
  end
end
