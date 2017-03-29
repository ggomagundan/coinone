require 'helper'
class TestCoinonePublic < TestCoinone

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
