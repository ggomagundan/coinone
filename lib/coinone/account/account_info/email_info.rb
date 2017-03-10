module Coinone

  class Account
    class AccountInfo
      class EmailInfo
        attr_reader :email, :is_authenticated

        def initialize(params={})
          @email = nil
          @is_authenticated = nil

          update_info(params)
        end

        def update_info(params={})
          @email = params[:email].strip if params.has_key? :email
          @is_authenticated = params[:isAuthenticated] == "true"
        end
      end

    end
  end
end


