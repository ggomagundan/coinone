require 'helper'
require 'rest-client'
require 'openssl'
require 'addressable/uri'
require 'base64'
require 'json'

class TestCoinone < Minitest::Test

  def setup

    @connection = Coinone::Connection.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

  end

  def test_get_user_info
    assert_equal Coinone::Account.new({},@connection).get_user_info, true
  end

end
