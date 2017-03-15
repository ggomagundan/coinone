class TestCoinonePublic < TestCoinone

  def test_get_currency

    response = get_data_body("public/currency")
    data = JSON.parse(response, symbolize_names: true)
    currency = Coinone::Public::Currency.new(data)

    assert_equal currency.result, "success"

  end

  def test_get_orderbook

    response = get_data_body("public/order_book")
    data = JSON.parse(response, symbolize_names: true)
    order_book = Coinone::Public::Currency.new(data)

    assert_equal order_book.result, "success"

  end

  def test_get_complete_orders

    response = get_data_body("public/recent_complete_orders")
    data = JSON.parse(response, symbolize_names: true)
    recent_complete_orders = Coinone::Public::Currency.new(data)

    assert_equal recent_complete_orders.result, "success"

  end

  def test_get_ticker

    response = get_data_body("public/ticker")
    data = JSON.parse(response, symbolize_names: true)
    ticker = Coinone::Public::Currency.new(data)

    assert_equal ticker.result, "success"

  end

end
