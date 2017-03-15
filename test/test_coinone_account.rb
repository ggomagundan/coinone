require 'helper'
class TestCoinone < Minitest::Test

  def setup

    @connection = Coinone::Connection.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

  end

  def test_get_user_info
    assert_equal Coinone::Account.new({},@connection).get_user_info.result, "success"
  end

  def test_get_balance
    assert_equal Coinone::Account.new({},@connection).get_balance.result, "success"
  end

  def test_get_daily_balane
    assert_equal Coinone::Account.new({},@connection).get_daily_balance.result, "success"
  end

  def test_get_deposite_address
    assert_equal Coinone::Account.new({},@connection).get_deposit_address.result, "success"
  end

end
