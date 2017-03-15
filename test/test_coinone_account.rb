class TestCoinoneAccount < TestCoinone

  def test_get_user_info

    response = get_data_body("account/user_info")
    data = JSON.parse(response, symbolize_names: true)
    user_info = Coinone::Account::AccountInfo.new(data)

    assert_equal user_info.result, "success"

  end

  def test_get_balance

    response = get_data_body("account/balance")
    data = JSON.parse(response, symbolize_names: true)
    balance = Coinone::Account::Balance.new(data)

    assert_equal balance.result, "success"

  end

  def test_get_daily_balane

    response = get_data_body("account/daily_balance")
    data = JSON.parse(response, symbolize_names: true)
    daily_balance = Coinone::Account::DailyBalance.new(data)

    assert_equal daily_balance.result, "success"

  end

  def test_get_deposite_address

    response = get_data_body("account/deposit_address")
    data = JSON.parse(response, symbolize_names: true)
    deposit_address = Coinone::Account::DepositAddress.new(data)

    assert_equal deposit_address.result, "success"

  end

  def test_get_virtual_account

    response = get_data_body("account/virtual_account")
    data = JSON.parse(response, symbolize_names: true)
    virtual_account = Coinone::Account::VirtualAccount.new(data)

    assert_equal virtual_account.result, "success"

  end

end
