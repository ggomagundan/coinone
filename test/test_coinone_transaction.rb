class TestCoinoneTransaction < TestCoinone

  def test_auth_number

    response = get_data_body("transaction/auth_number")
    data = JSON.parse(response, symbolize_names: true)
    auth_number = Coinone::Transaction::AuthNumberResponse.new(data)

    assert_equal auth_number.result, "success"

  end

  def test_coin_history

    response = get_data_body("transaction/coin_history")
    data = JSON.parse(response, symbolize_names: true)
    coin_history = Coinone::Transaction::CoinHistory.new(data)

    assert_equal coin_history.result, "success"

  end

  def test_krw_history

    response = get_data_body("transaction/krw_history")
    data = JSON.parse(response, symbolize_names: true)
    krw_history = Coinone::Transaction::KrwHistory.new(data)

    assert_equal krw_history.result, "success"

  end

  def test_send_coin

    response = get_data_body("transaction/send_coin")
    data = JSON.parse(response, symbolize_names: true)
    send_coin = Coinone::Transaction::SendCoinResponse.new(data)

    assert_equal send_coin.result, "success"

  end



end
