module Coinone

  class Account
    class FeeRate
      class Etc
        attr_reader :taker, :maker

        def initialize(params={})
          @taker = nil
          @maker = nil
          update_info(params)
        end

        def update_info(params={})
          @taker = params[:taker] if params.has_key? :taker
          @maker = params[:maker] if params.has_key? :maker
        end

      end
    end

  end
end


