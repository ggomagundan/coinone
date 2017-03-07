require 'rest-client'
require 'openssl'
require 'addressable/uri'

require 'coinone/error'

module Coinone

  class Connection

     attr_reader :access_token, :secret_key

     BASE_URI = "https://api.coinone.co.kr/v2"
     REQUEST_URI = "https://coinone.co.kr/account/login/"
     AUTH_URI = "https://api.coinone.co.kr/oauth/access_token/"
     REFRESH_AUTH_URI = "https://api.coinone.co.kr/oauth/refresh_token/" 
     DELETE_AUTH_URI = "https://api.coinone.co.kr/oauth/delete_token/"
     ACCESS_TOKEN = "ea3e8668-58cc-4eba-84b2-cdfbe616e5cc"
     SECRET_KEY= "dac26d4b-558f-4ada-b2ad-549bc1242554"

     def self.factory(params) # :nodoc
       Connection.new(
         access_token: params[:access_token],
         secret_key: params[:secret_key]
       )
     end

     def initialize(options={}) # :nodoc

       @access_token = options[:access_token] || nil
       @secret_key = options[:secret_key] || nil

     end

     def resource
       @@resouce ||= RestClient::Resource.new( BASE_URI )
     end

     def get( connection_uri, params = {} )
       resource[ connection_uri ].get params: params.merge(access_token: @access_token)
     end

     def post( connection_uri, params = {} )
       params[:access_token] = @access_token
       params[:nonce]   = Time.now.to_i / 10000
       payload = create_coinone_payload(params)
       signature = create_coinone_signature(payload)
=begin
       puts "Send To : #{connection_uri}"
       puts "params: #{params}"
       puts "payload: #{payload}"
       puts "signature:  #{create_coinone_signature(payload)}"
=end

       resource[ connection_uri ].post params, {'Content-Type': 'application/json', 'X-COINONE-PAYLOAD': payload, 'X-COINONE-SIGNATURE': signature }

     end

     def create_coinone_signature( payload )
       OpenSSL::HMAC.hexdigest( 'sha512', SECRET_KEY.upcase, payload)
     end

     def create_coinone_payload( data )
       Base64.strict_encode64(data.to_json).chomp
     end

     def check_for_errors(response)
       # {"errorCode"=>"130", "errorMessage"=>"V2 API Nonce value must be a positive integer", "result"=>"error"} 
       response = JSON.parse(response) 
       case response["errorCode"].to_i 
         when 11 then raise AccessTokenMissingError, response["errorMessage"]
         when 12 then raise InvalidAccessTokenError, response["errorMessage"]
         when 40 then raise InvalidAPIPermissionError, response["errorMessage"]
         when 50 then raise AuthenticateError, response["errorMessage"]
         when 51 then raise InvalidAPIError, response["errorMessage"]
         when 100 then raise SessionExpiredError, response["errorMessage"]
         when 101 then raise InvalidFormatError, response["errorMessage"]
         when 102 then raise IDMissingError, response["errorMessage"]
         when 103 then raise LackOfBalanceError, response["errorMessage"]
         when 104 then raise OrderIdMissingError, response["errorMessage"]
         when 105 then raise PriceNotCorrectError, response["errorMessage"]
         when 106 then raise LockingError, response["errorMessage"]
         when 107 then raise ParameterError, response["errorMessage"]
         when 111 then raise OrderIdMissingError, response["errorMessage"]
         when 112 then raise CancelFailedError, response["errorMessage"]
         when 113 then raise QuantityTooLowError, response["errorMessage"]
         when 120 then raise APIV2PayloadMissingError, response["errorMessage"]
         when 121 then raise APIV2SignatureMissingError, response["errorMessa ge"]
         when 122 then raise APIV2NonceMissingError, response["errorMessage"]
         when 123 then raise APIV2SignatureIsNotCorrectError, response["errorMessage"]
         when 130 then raise APIV2NonceValueMustBePosiveIntegerError, response["errorMessage"]
         when 131 then raise APIV2NonceBiggerThenLastNonceError, response["errorMessage"]
         when 132 then raise APIV2BodyIsCorruptedError, response["errorMessage"]
         when 150 then raise APIV2Call150Error, response["errorMessage"]
         when 151 then raise APIV2Call151Error, response["errorMessage"]
         when 200 then raise WalletError, response["errorMessage"]
         when 202 then raise Limitation202Error, response["errorMessage"]
         when 210 then raise Limitation210Error, response["errorMessage"]
         when 220 then raise Limitation220Error, response["errorMessage"]
         when 221 then raise Limitation221Error, response["errorMessage"]
         when 310 then raise MobileAuthError, response["errorMessage"]
         when 311 then raise NeedMobileAuthError, response["errorMessage"]
         when 312 then raise NameIsNotCorrectError, response["errorMessage"]
         when 330 then raise PhoneNumberError, response["errorMessage"]
         when 404 then raise PageNotFoundError, response["errorMessage"]
         when 405 then raise ServerError, response["errorMessage"]
         when 444 then raise LockingError, response["errorMessage"]
         when 500 then raise Email500Error, response["errorMessage"]
         when 501 then raise EMail501Error, response["errorMessage"]
         when 777 then raise MobileAuthError, response["errorMessage"]
         when 778 then raise PhoneNumberError, response["errorMessage"]
         when 1202 then raise AppNotFoundError, response["errorMessage"]
         when 1203 then raise AlreadyRegisteredError, response["errorMessage"]
         when 1204 then raise InvalidAccessError, response["errorMessage"]
         when 1205 then raise APIKeyError, response["errorMessage"]
         when 1206 then raise UserNotFound1206Error, response["errorMessage"]
         when 1207 then raise UserNotFound1207Error, response["errorMessage"]
         when 1208 then raise UserNotFound1208Error, response["errorMessage"]
         when 1209 then raise UserNotFound1209Error, response["errorMessage"]
       end
     end
  end


end
