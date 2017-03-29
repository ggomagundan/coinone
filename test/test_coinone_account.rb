require 'helper'
class TestCoinoneAccount < TestCoinone

  def test_get_user_info
    sleep 1
    assert_equal Coinone::Account.new({},@connection).get_user_info.result, "success"
  end

  def test_get_balance
    sleep 1
    assert_equal Coinone::Account.new({},@connection).get_balance.result, "success"
  end

  def test_get_daily_balane
    sleep 1
    assert_equal Coinone::Account.new({},@connection).get_daily_balance.result, "success"
  end

  def test_get_deposite_address
    sleep 1
    assert_equal Coinone::Account.new({},@connection).get_deposit_address.result, "success"
  end

  def test_get_virtual_account
    sleep 1
    assert_equal Coinone::Account.new({},@connection).get_virtual_account.result, "success"
  end

end
