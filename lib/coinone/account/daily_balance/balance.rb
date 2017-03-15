
module Coinone

  class Account

    class DailyBalance
      class Balance

        attr_reader :timestamp, :value, :btc, :eth, :etc, :krw

        def initialize(options={})

          @timestamp = nil
          @value = 0
          @btc = 0
          @eth = 0
          @etc = 0
          @krw = 0

          update_balance(options)
        end

        def update_balance(params={})

          @timestamp= params[:timestamp].to_i if params.has_key? :timestamp
          @value = params[:value].to_d if params.has_key? :value
          @btc = params[:btc].to_d if params.has_key? :btc
          @eth = params[:eth].to_d if params.has_key? :eth
          @etc = params[:etc].to_d if params.has_key? :etc
          @krw = params[:krw].to_d if params.has_key? :krw

        end



      end
    end
  end
end
