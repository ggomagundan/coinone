require 'coinone/account/balance/wallet'
require 'coinone/account/balance/normal_wallet'

module Coinone

  class Account

    class Balance

      attr_reader :result
      attr_reader :normal_wallets, :btc, :eth, :etc

      def initialize(options={})

        @result = options[:result] || nil
        @normal_wallets = []
        @btc = Wallet.new()
        @eth = Wallet.new()
        @etc = Wallet.new()

        keys = [:normalWallets, :btc, :eth, :eth]
        update_balance(options) if keys.any? { |key| options.has_key? key}


      end

      def update_balance(params={})


        @result = params[:result] if params.has_key? :result
        if params.has_key? :normalWallets
          @normal_wallets.clear
          params[:normalWallets].each do |wallet|
            @normal_wallets.push(NormalWallet.new(wallet))
          end
        end

        @btc.update_wallet(params[:btc]) if params.has_key? :btc
        @eth.update_wallet(params[:eth]) if params.has_key? :eth
        @etc.update_wallet(params[:etc]) if params.has_key? :etc

      end



    end
  end
end
