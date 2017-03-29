require 'helper'
class TestCoinone < Minitest::Test

  def setup

    @connection = Coinone::Connection.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

  end

  def test_get_connection_access_token
    assert_equal @connection.access_token, ENV['COINONE_ACCESS_TOKEN']
  end

  def test_get_connection_access_token
    assert_equal @connection.secret_key, ENV['COINONE_SECRET_KEY']
  end

end
