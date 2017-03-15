class TestCoinoneOrder < TestCoinone

  def test_cancel_all_order

    response = get_data_body("order/cancel_all_order")
    data = JSON.parse(response, symbolize_names: true)
    cancel_all_order = Coinone::Order::CancelAllOrderResponse.new(data)

    assert_equal cancel_all_order.result, "success"

  end

  def test_cancel_order

    response = get_data_body("order/cancel_order")
    data = JSON.parse(response, symbolize_names: true)
    cancel_order = Coinone::Order::CancelOrderResponse.new(data)

    assert_equal cancel_order.result, "success"

  end

  def test_limit_buy

    response = get_data_body("order/limit_buy")
    data = JSON.parse(response, symbolize_names: true)
    limit_buy = Coinone::Order::TradeResponse.new(data)

    assert_equal limit_buy.result, "success"

  end

  def test_limit_sell

    response = get_data_body("order/limit_sell")
    data = JSON.parse(response, symbolize_names: true)
    limit_sell = Coinone::Order::TradeResponse.new(data)

    assert_equal limit_sell.result, "success"

  end

  def test_market_buy

    response = get_data_body("order/market_buy")
    data = JSON.parse(response, symbolize_names: true)
    market_buy = Coinone::Order::TradeResponse.new(data)

    assert_equal market_buy.result, "success"

  end

  def test_market_sell

    response = get_data_body("order/market_sell")
    data = JSON.parse(response, symbolize_names: true)
    market_sell = Coinone::Order::TradeResponse.new(data)

    assert_equal market_sell.result, "success"

  end


  def test_my_complete_orders

    response = get_data_body("order/my_complete_orders")
    data = JSON.parse(response, symbolize_names: true)
    my_complete_orders = Coinone::Order::CompleteOrders.new(data)

    assert_equal my_complete_orders.result, "success"

  end

  def test_my_limit_orders

    response = get_data_body("order/my_limit_orders")
    data = JSON.parse(response, symbolize_names: true)
    my_limit_orders = Coinone::Order::LimitOrders.new(data)

    assert_equal my_limit_orders.result, "success"

  end



end
