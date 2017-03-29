module Coinone

  class Transaction

    class AuthNumberResponse

      attr_reader :result

      def initialize(options={})

        @result = options[:result] || nil

        update_response(options)


      end

      def update_response(params={})

        @result = params[:result] if params.has_key? :result

      end

    end
  end
end
