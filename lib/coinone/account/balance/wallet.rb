module Coinone

  class Account
    class Balance
      class Wallet
        attr_reader :avail, :balance

        def initialize(params={})
          @avail = nil
          @balance = nil
          update_wallet(params)
        end

        def update_wallet(params={})
          @avail = params[:avail].to_d if params.has_key? :avail
          @balance = params[:balance].to_d if params.has_key? :balance
          # If wanna Full Decimal 
          # => OBJ.to_digits
        end

        def avail
          @avail.to_digits
        end

        def balance
          @balance.to_digits
        end

      end

    end
  end
end


