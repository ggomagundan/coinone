module Coinone
  class Account
    class AccountInfo
      class FeeRates
        class FeeRate
          attr_reader :taker, :maker

          def initialize(params={})
            @taker = nil
            @maker = nil
            update_info(params)
          end

          def update_info(params={})
            @taker = params[:taker].to_f if params.has_key? :taker
            @maker = params[:maker].to_f if params.has_key? :maker
          end

        end
      end

    end
  end
end


