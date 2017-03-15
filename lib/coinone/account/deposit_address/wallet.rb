
module Coinone

  class Account

    class DepositAddress
      class Wallet

        attr_reader :address

        def initialize(options={})

          @address = nil

          update_address(options)
        end

        def update_address(params={})

          @address = params[:btc] if params.has_key? :btc
          @address = params[:eth] if params.has_key? :eth
          @address = params[:etc] if params.has_key? :etc

        end



      end
    end
  end
end
