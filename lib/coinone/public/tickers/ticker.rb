module Coinone

  module Public
    class Tickers
      class Ticker
        attr_reader :volume, :last, :high, :currency, :low, :first

        def initialize(params={})

          @volume = params[:volume].to_f || nil
          @last= params[:last].to_i || nil
          @high= params[:high].to_i || nil
          @currency= params[:currency] || nil
          @low= params[:low].to_i || nil
          @first= params[:first].to_i || nil

        end
      end

    end
  end

end
