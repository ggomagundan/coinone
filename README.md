# Coinone
[![GemVersion](https://badge.fury.io/rb/coinone.svg)](https://badge.fury.io/rb/coinone) ![](http://ruby-gem-downloads-badge.herokuapp.com/coinone?type=total)  [![Code Climate](https://lima.codeclimate.com/github/ggomagundan/coinone/badges/gpa.svg)](https://lima.codeclimate.com/github/ggomagundan/coinone) 

[![Build Status](https://travis-ci.org/ggomagundan/coinone.svg?branch=master)](https://travis-ci.org/ggomagundan/coinone) [![GitHub issues](https://img.shields.io/github/issues/ggomagundan/coinone.svg)](https://github.com/ggomagundan/coinone/issues) [![Dependency Status](https://gemnasium.com/badges/github.com/ggomagundan/coinone.svg)](https://gemnasium.com/github.com/ggomagundan/coinone) [![Coverage Status](https://coveralls.io/repos/github/ggomagundan/coinone/badge.svg)](https://coveralls.io/github/ggomagundan/coinone)

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/ggomagundan/coinone/master/LICENSE.txt)

`Coinone` Gem is Ruby Language porting from Coinone API, and only support V2.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coinone'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coinone

## Usage

First, You set `ACCESS_TOKEN` and `SECRET_KEY` using [figaro](https://github.com/laserlemon/figaro) or [dotenv](https://github.com/bkeepers/dotenv)

#### Account V2
- ACCOUNT V2 / Account Infomation
```ruby
user =  Coinone::Account.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

user_info = user.get_user_info

```
|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|security_level | Integer | User's security level. Summation of authentications.|
|virtual_account_info ||Virtual account's information.|
|-  depositor|String|Virtual account's depositor.|
|- account_number|String |Virtual account's number.|
|- bank_name|String |Virtual account's bank name.|
| mobile_info ||Mobile authentication's information.|
|- user_name|String |Mobile phone's user name.|
|- phone_number|String | Phone number.|
|- phone_corp|String| Mobile phone's corporation code.|
|- is_authenticated|Boolean | 'true' If a user is authenticated.|
|bank_info||User's bank information.|
|- depositor|String |Account's depositor.|
|- bank_code |String |Account's bankCode. ([Link](https://en.wikipedia.org/wiki/List_of_banks_in_South_Korea))|
|- account_number|String |Account's number.|
|-  is_authenticated|Boolean |'true' if a user is authenticated.|
|email_info||User's email information.|
|- is_authenticated |Boolean | 'true' if a user is authenticated.|
|- email |String 	|User's email address.|
| fee_rates ||User's fee.|
|- btc | |User's fee.|
|- - maker |Float |Percent of BTC maker fee.|
|- - taker |Float 	|Percent of BTC taker fee.|
|- eth | |User's fee.|
|- - maker | Float |Percent of ETH maker fee.|
|- - taker|Float |Percent of ETH taker fee.|
|- etc | |User's fee.|
|- - maker |Float |Percent of ETC maker fee.|
|- - taker |Float |Percent of ETC taker fee.|

- ACCOUNT V2 / Balance
```ruby
user =  Coinone::Account.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

balance = user.get_balance

```
|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|btc||BTC information.|
|- avail|BigDecimal|Available BTC.|
|- balance|BigDecimal|Total BTC.|
|eth||ETH information.|
|- avail|BigDecimal|Available ETH.|
|- balance|BigDecimal|Total ETH.|
|etc||ETC information.|
|- avail|BigDecimal|Available ETC.|
|- balance|BigDecimal|Total ETC.|
|normal_wallets|Array|BTC normal wallet information.|
|- balance|BigDecimal|Total BTC.|
|- label|String |Normal Wallet Label.|
 


- ACCOUNT V2 / Daily Balance
```ruby
user =  Coinone::Account.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

daily_balance = user.get_daily_balance

```
|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|daily_balances|Array|Daily balance's information.|
|- timestamp|Integer|Timestamp|
|- value|Integer|Overall balance's value in KRW.|
|- btc|BigDecimal|BTC balance.|
|- etc|BigDecimal|ETH balance.|
|- etc|BigDecimal|ETC balance.|
|- krw|BigDecimal|KRW balance.|


- ACCOUNT V2 / Deposit Address
```ruby
user =  Coinone::Account.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

deposit_address = user.get_deposit_address

```

|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|btc||BTC information.|
|- address|String|BTC wallet address.|
|eth||ETH information.|
|- address|String|ETH wallet address.|
|etc||ETC information.|
|- address|String|ETC wallet address.|

- ACCOUNT V2 / Virtual Account

```ruby
user =  Coinone::Account.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

virtual_address = user.get_virtual_account

```

|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|depositor|String|Virtual account's depositor.|
|account_number|String|Virtual account's number.|
|bank_name|String|Virtual account's bank name.|


#### OAUTH

- OAUTH / Delete Access Token
- OAUTH / Get Access Token
- OAUTH / Get Request  Token
- OAUTH / Refresh Access Token

#### ORDER V2

- ORDER V2 / Cancel All Order

```ruby
order =  Coinone::Order.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

default_cancel_all = order.cancel_all_order()  # Default currency "btc"
btc_cancel_all = order.cancel_all_order(currency: "btc")
eth_cancel_all = order.cancel_all_order(currency: "eth") 
etc_cancel_all = order.cancel_all_order(currency: "etc") 

```
|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|success_canceled_orders|The number of canceled orders.|
|overall_orders|Integer|The number of overall orders before canceled.|

- ORDER V2 / Cancel Order
```ruby
order =  Coinone::Order.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

cancel_order = order.cancel_order(order_id: "COINONE_ORDER_ID", price: CANCEL_PRICE, qty: CANCEL_QTY, is_ask: 1(SET "1" IS SELL) , currency: "btc or eth or etc")
# cancel_order = order.cancel_order(order_id: "f9c53135-952d-44ef-bc77-b3ab4f1c445c", price: 1500000, qty: 0.3, is_ask: 1, currency: "eth")


```
|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|

- ORDER V2 / Limit Buy

```ruby
order =  Coinone::Order.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

limit_buy = order.get_limit_buy(currency: "currency: "btc or eth or etc"", price: BUY_PRICE, qty: BUY_QTY)
# limit_buy = order.get_limit_buy(currency: "eth", price: 56000, qty: 1)

```
|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|order_id | String | Order ID|


- ORDER V2 / Limit Sell
```ruby
order =  Coinone::Order.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

limit_buy = order.get_limit_sell(currency: "currency: "btc or eth or etc"", price: BUY_PRICE, qty: BUY_QTY)
# limit_buy = order.get_limit_sell(currency: "eth", price: 56000, qty: 1)

```
|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|order_id | String | Order ID|

- ORDER V2 / Market Buy
```ruby
order =  Coinone::Order.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

limit_buy = order.get_market_buy(currency: "currency: "btc or eth or etc"", price: BUY_PRICE)
# limit_buy = order.get_market_buy(currency: "eth", price: 200000)

```
|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|order_id | String | Order ID|

- ORDER V2 / Market Sell
```ruby
order =  Coinone::Order.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

limit_buy = order.get_market_sell(currency: "currency: "btc or eth or etc"", qty: SELL_QTY)
# limit_buy = order.get_market_sell(currency: "eth", qty: 10)

```
|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|order_id | String | Order ID|

- ORDER V2 / My Complete Orders
```ruby
order =  Coinone::Order.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

complete_orders = order.get_complete_orders(currency: "eth")

``` 
|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|complete_orders |Array|List of completed orders.|
|- timestamp|Integer|Timestamp.|
|- price|Integer|price of order.|
|- qty|Float|quantity of order.|
|- type|String|Order Type sell: 'ask', buy: 'bid'|
|- fee_rate|Float|Fee rate.|
|- fee|Float|Fee.|
|- order_id|String|Order ID.|


- ORDER V2 / My Limit Orders
```ruby
order =  Coinone::Order.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

complete_orders = order.get_complete_orders(currency: "eth")

``` 
|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|limit_orders |Array|List of limit orders.|
|- index|Integer|Index of order..|
|- timestamp|Integer|Timestamp.|
|- price|Integer|price of order.|
|- qty|Float|quantity of order.|
|- order_id|String|Order ID.|
|- type|String|Order Type sell: 'ask', buy: 'bid'|
|- fee_rate|Float|Fee rate.|


#### PUBLIC

Not Need `ACCESS_TOKEN` and `SECRET_KEY`

- PUBLIC / Currency
```ruby
currency =  Coinone::Public.get_currency


```

|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|currency|Float |Currency Rate.|
|currency_type |String | Currency Type. Ex) USD, KRW..|


- PUBLIC / Orderbook
```ruby
orderbook =  Coinone::Public.get_orderbook # Default "BTC"

btc_orderbook =  Coinone::Public.get_orderbook(currency: "btc") # BTC Orderbook

eth_orderbook =  Coinone::Public.get_orderbook(currency: "eth") # ETH Orderbook

etc_orderbook =  Coinone::Public.get_orderbook(currency: "etc") # ETC Orderbook

xrp_orderbook =  Coinone::Public.get_orderbook(currency: "xrp") # XRP Orderbook

```
|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|ask |Array|Ask List.|
|- price|Integer|Ask KRW price.|
|- qty|Float|Ask BTC(or ETH, ETC, XRP) quantity.|
|bid|Array|Bid List.|
|- price |Integer|Bid KRW price.|
|- qty|Float|Bid BTC(or ETH, ETC, XRP) quantity.|
|timestamp|Integer|Timestamp.|
|currency|String |Currency.|


- PUBLIC / Recent Complete Orders
```ruby
complete_orders =  Coinone::Public.get_complete_orders # Default "BTC" and "Hour"

btc_hour_complete_orders =  Coinone::Public.get_complete_orders(currency: "btc", period: "hour") # BTC and Hour Complete Orders

btc_day_complete_orders =  Coinone::Public.get_complete_orders(currency: "btc", period: "day") # BTC and Day Complete Orders

eth_hour_complete_orders =  Coinone::Public.get_complete_orders(currency: "eth", period: "hour") # ETH and Hour Complete Orders

eth_day_complete_orders =  Coinone::Public.get_complete_orders(currency: "eth", period: "day") # ETH and Day Complete Orders

etc_hour_complete_orders =  Coinone::Public.get_complete_orders(currency: "etc", period: "hour") # ETC and Hour Complete Orders

etc_day_complete_orders =  Coinone::Public.get_complete_orders(currency: "etc", period: "day") # ETC and Hour Complete Orders 

xrp_hour_complete_orders =  Coinone::Public.get_complete_orders(currency: "xrp", period: "hour") # XRP and Hour Complete Orders

xrp_day_complete_orders =  Coinone::Public.get_complete_orders(currency: "xrp", period: "day") # XRP and Hour Complete Orders 

```

|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|orders |Array|Recent complete orders.|
|- price|Integer|Ask KRW price.|
|- qty|Float|BTC(or ETH, ETC) quantity.|
|- timestamp|Integer|Timestamp.|
|timestamp|Integer|Timestamp.|
|currency|String |Currency.|



- PUBLIC / Ticker
```ruby
ticker =  Coinone::Public.get_ticker # Default "BTC"

btc_ticker =  Coinone::Public.get_ticker(currency: "btc") # BTC Ticker

eth_ticker =  Coinone::Public.get_ticker(currency: "eth") # ETH Ticker

etc_ticker =  Coinone::Public.get_ticker(currency: "etc") # ETC Ticker

xrp_ticker =  Coinone::Public.get_ticker(currency: "xrp") # ETC Ticker

all_ticker =  Coinone::Public.get_ticker(currency: "all") # ALL Ticker

```

|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|timestamp|Integer|Timestamp.|
|tickers |Array|Tickers List|
|- high|Integer|Highest price in 24 hours.|
|- low|Integer|Lowest price in 24 hours.|
|- last |Integer|Last completed price.|
|- first |Integer|First price in 24 hours.|
|- volume|Float|BTC volume of completed orders in 24 hours.|
|- currency|String |Currency.|



#### TRANSACTION V2 

- TRANSACTION V2 / 2-Factor Authentication

```ruby
transaction =  Coinone::Transaction.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

krw_2factor =  transaction.get_auth_number(type: "krw") 

btc_2factor =  transaction.get_auth_number(type: "btc") 

eth_2factor =  transaction.get_auth_number(type: "eth") 

etc_2factor =  transaction.get_auth_number(type: "etc") 

```

|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|

- TRANSACTION V2 / Coin Transactions History

```ruby
transaction =  Coinone::Transaction.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

btc_history =  transaction.get_coin_history(currency: "btc")

eth_history =  transaction.get_coin_history(currency: "eth")

etc_history =  transaction.get_coin_history(currency: "etc")

```

|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|histories|Array|Coin transactions history.|
|- txid |String|Transaction ID.|
|- type |String|Transaction type. send: "send", receive: "receive".|
|- from |String|From address.|
|- to |String|To address.|
|- confirmations |Integer|Confirmations.|
|- quantity |Float|Transaction quantity.|
|- timestamp |Integer|Timestamp.|

- TRANSACTION V2 / KRW Transactions History

```ruby
transaction =  Coinone::Transaction.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

krw_history =  transaction.get_krw_history()

krw_history.histories.first.process_level_to_s  # Change process_level to Level String
=> "Deposit Completed" 


```

|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|histories|Array|KRW transactions history.|
|- bank_code |Integer|Bank code.|
|- account_number |String|Bank account number.|
|- depositor |String|Depositor's name|
|- amount |Integer|Transaction amount.|
|- process_level |Integer|KRW transaction's process level. 1: Deposit Completed, 2: Request Withdrawal, 3: Request Accepted, 4: Withrawal Canceled, 5: Withdrawal Completed.|
|- timestamp |Integer|Timestamp.|

- TRANSACTION V2 / Send Coin

```ruby
transaction =  Coinone::Transaction.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

btc_send_coin =  transaction.send_coin(currency: "btc", address: "xxxxxxxxxxxxxxxxx", auth_number: "XXXX", qty: 1)
btc_send_coin.transaction_url # BTC Transaction Tracker URL
=> "https://blockchain.info/tx/xxxxxxxxxxxxxxxxx"

eth_send_coin =  transaction.send_coin(currency: "eth", address: "0x#####", auth_number: "XXXX", qty: 1)
eth_send_coin.transaction_url # ETH Transaction Tracker URL
=> "https://etherscan.io/tx/0x##########"

etc_send_coin =  transaction.send_coin(currency: "etc", address: "0x#####", auth_number: "XXXX", qty: 1)
etc_send_coin.transaction_url # ETC Transaction Tracker URL
=> "https://gastracker.io/tx/0x#####"


```

|AttributeName |  Class | Description|
|----------- | ------------- | -------------|
|result | String | Request's result|
|txid | String | TxID|


## ToDo
- [x] ACCOUNT V2 / Account Infomation
- [x] ACCOUNT V2 / Balance
- [x] ACCOUNT V2 / Daily Balance
- [x] ACCOUNT V2 / Deposit Address
- [x] ACCOUNT V2 / Virtual Account

- [ ] OAUTH / Delete Access Token
- [ ] OAUTH / Get Access Token
- [ ] OAUTH / Get Request  Token
- [ ] OAUTH / Refresh Access Token

- [x] ORDER V2 / Cancel All Order
- [x] ORDER V2 / Cancel Order
- [x] ORDER V2 / Limit Buy
- [x] ORDER V2 / Limit Sell
- [x] ORDER V2 / Market Buy
- [x] ORDER V2 / Market Sell
- [x] ORDER V2 / My Complete Orders
- [x] ORDER V2 / My Limit Orders

- [x] PUBLIC / Currency
- [x] PUBLIC / OrderBook
- [x] PUBLIC / Recent Complete Orders
- [x] PUBLIC / Ticker

- [x] TRANSACTION V2 / 2-Factor Authentication
- [x] TRANSACTION V2 / Coin Transactions History
- [x] TRANSACTION V2 / KRW Transactions History
- [x] TRANSACTION V2 / Send Coin

## Full documentation 

The Documentation is at [Coinone Docs](http://doc.coinone.co.kr/)

## Change Log

Current Version 0.8.0.a

This link listing [Change Log](https://github.com/ggomagundan/coinone/blob/master/CHANGE_LOG.md)



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


## Donate

Welcome to Donation :)

- Ƀ BTC : 16MdVNJgvGYbVuaC6KrjGNy2RCrNsaPaZz
- Ξ ETH : 0xC4347246c9469ca4d740Cd2927d38b5EaB354df8
- ETC : 0xc45b10108920b5f20e574bbf021e73d93af5dbc8


