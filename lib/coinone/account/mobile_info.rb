module Coinone

  class Account
    class MobileInfo
      attr_reader :user_name, :phone_number, :phone_corp, :is_authenticated

      def initialize(params={})
        @user_name = nil
        @phone_number = nil
        @phone_corp = nil
        @is_authenticated = nil
        update_info(params)
      end

      def update_info(params={})

        @user_name = params[:userName].strip if params.has_key? :userName
        @phone_number = params[:phoneNumber].strip if params.has_key? :phoneNumber
        @phone_corp = params[:phoneCorp].strip if params.has_key? :phoneCorp
        @is_authenticated = params[:isAuthenticated] == "true"

      end
    end

  end
end


