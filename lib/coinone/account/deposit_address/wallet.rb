
module Coinone

  class Account

    class DepositAddress
      class Wallet

        attr_reader :address
        attr_reader :destination_tag

        def initialize(options={})

          @address = nil
          @destination_tag = nil

          update_address(options)
        end

        def update_address(params={})

          @address = params[:btc] if params.has_key? :btc
          @address = params[:eth] if params.has_key? :eth
          @address = params[:etc] if params.has_key? :etc
          if params.has_key? :xrp
            @address = params[:xrp] if params.has_key? :xrp
            @destination_tag = params[:destinationTag] if params.has_key? :destinationTag
          end

        end



      end
    end
  end
end
