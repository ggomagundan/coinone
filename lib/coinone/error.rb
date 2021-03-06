module Coinone
  #class HTTPRequestFailed < StandardError; end
  class AccessTokenMissingError < StandardError; end # 11
  class InvalidAccessTokenError < StandardError; end # 12
  class InvalidAPIPermissionError < StandardError; end # 40
  class AuthenticateError < StandardError; end # 50
  class InvalidAPIError < StandardError; end # 51
  class SessionExpiredError < StandardError; end # 100
  class InvalidFormatError < StandardError; end # 101
  class IDMissingError < StandardError; end # 102
  class LackOfBalanceError < StandardError; end # 103
  class OrderIdMissingError < StandardError; end # 104
  class PriceNotCorrectError < StandardError; end # 105
  class LockingError < StandardError; end # 106
  class ParameterError < StandardError; end # 107
  class OrderIdMissingError < StandardError; end # 111
  class CancelFailedError < StandardError; end # 112
  class QuantityTooLowError < StandardError; end # 113
  class APIV2PayloadMissingError < StandardError; end # 120
  class APIV2SignatureMissingError < StandardError; end # 121
  class APIV2NonceMissingError < StandardError; end # 122
  class APIV2SignatureIsNotCorrectError < StandardError; end # 123
  class APIV2NonceValueMustBePosiveIntegerError < StandardError; end # 130
  class APIV2NonceBiggerThenLastNonceError < StandardError; end # 131
  class APIV2BodyIsCorruptedError < StandardError; end # 132
  class APIV2Call150Error < StandardError; end # 150
  class APIV2Call151Error < StandardError; end # 151
  class WalletError < StandardError; end # 200
  class Limitation202Error < StandardError; end # 202
  class Limitation210Error < StandardError; end # 210
  class Limitation220Error < StandardError; end # 220
  class Limitation221Error < StandardError; end # 221
  class MobileAuthError < StandardError; end # 310
  class NeedMobileAuthError < StandardError; end # 311
  class NameIsNotCorrectError < StandardError; end # 312
  class PhoneNumberError < StandardError; end # 330
  class PageNotFoundError < StandardError; end # 404
  class ServerError < StandardError; end # 405
  class LockingError < StandardError; end # 444
  class Email500Error < StandardError; end # 500
  class EMail501Error < StandardError; end # 501
  class MobileAuthError < StandardError; end # 777
  class PhoneNumberError < StandardError; end # 778
  class AppNotFoundError < StandardError; end # 1202
  class AlreadyRegisteredError < StandardError; end # 1203
  class InvalidAccessError < StandardError; end # 1204
  class APIKeyError < StandardError; end # 1205
  class UserNotFound1206Error < StandardError; end # 1206
  class UserNotFound1207Error < StandardError; end # 1207
  class UserNotFound1208Error < StandardError; end # 1208
  class UserNotFound1209Error < StandardError; end # 1209
end
