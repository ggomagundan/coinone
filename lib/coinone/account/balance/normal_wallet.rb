module Coinone

  class Account
    class Balance
      class NormalWallet
        attr_reader :balance, :label

        def initialize(params={})
          @balance = nil
          @label = nil
          update_wallet(params)
        end

        def update_wallet(params={})
          @balance = params[:balance].to_d if params.has_key? :balance
          @balance = params[:label] if params.has_key? :label

          # If wanna Full Decimal 
          # => OBJ.to_digits
        end

        def balance
          @balance.to_digits
        end

      end

    end
  end
end


