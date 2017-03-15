module Coinone

  class Transaction

    class KrwHistory
      class History

        attr_reader :bank_code, :account_number, :depositor, :amount, :process_level, :timestamp

        def initialize(options={})

          @bank_code = nil
          @account_number = nil
          @depositor = nil
          @amount = nil
          @process_level = nil
          @timestamp = nil

          update_history(options)


        end

        def update_history(params={})

          @bank_code = params[:bankCode].to_i if (params.has_key? :bankCode) && !params[:bankCode].nil?
          @account_number = params[:accountNumber].strip if (params.has_key? :accountNumber) && !params[:accountNumber].nil?
          @depositor =  params[:depositor].strip if (params.has_key? :depositor) && !params[:depositor].nil?
          @amount =  params[:amount].to_i if params.has_key? :amount
          @process_level =  params[:processLevel].to_i if (params.has_key? :processLevel) && !params[:processLevel].nil?
          @timestamp =  params[:timestamp].to_i if params.has_key? :timestamp

        end

        def process_level_to_s
          level_list = ["", "Deposit Completed", "Request Withdrawal", "Request Accepted", "Withrawal Canceled", "Withdrawal Completed"]
          if @process_level.blank?
            str = ""
          else
            str = level_list[@process_level]
          end
          str
        end

      end
    end
  end
end
