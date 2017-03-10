require 'helper'
class TestCoinonePublic < Minitest::Test

  def setup

    @connection = Coinone::Connection.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

  end

  def test_get_currency
    assert_equal Coinone::Public.get_currency().result, "success"
  end

  def test_get_orderbook
    assert_equal Coinone::Public.get_orderbook().result, "success"
  end

  def test_get_complete_orders
    assert_equal Coinone::Public.get_complete_orders().result, "success"
  end

  def test_get_ticker
    assert_equal Coinone::Public.get_ticker().result, "success"
  end

end
