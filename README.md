# Coinone
[![GemVersion](https://badge.fury.io/rb/coinone.svg)](https://badge.fury.io/rb/coinone) ![](http://ruby-gem-downloads-badge.herokuapp.com/coinone?type=total)  [![Code Climate](https://lima.codeclimate.com/github/ggomagundan/coinone/badges/gpa.svg)](https://lima.codeclimate.com/github/ggomagundan/coinone) 
[![Build Status](https://travis-ci.org/ggomagundan/coinone.svg?branch=master)](https://travis-ci.org/ggomagundan/coinone) [![GitHub issues](https://img.shields.io/github/issues/ggomagundan/coinone.svg)](https://github.com/ggomagundan/coinone/issues) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/ggomagundan/coinone/master/LICENSE.txt)

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
AttributeName |  Class | Description
----------- | ------------- | -------------
result | String | Request's result
security_level | Integer | User's security level. Summation of authentications.
virtual_account_info ||Virtual account's information.
-  depositor|String|Virtual account's depositor.
- account_number|String |Virtual account's number.
- bank_name|String |Virtual account's bank name.
  mobile_info ||Mobile authentication's information.
- user_name|String |Mobile phone's user name.
- phone_number|String | Phone number.
- phone_corp|String| Mobile phone's corporation code.
- is_authenticated|Boolean | 'true' If a user is authenticated.
bank_info||User's bank information.
- depositor|String |Account's depositor.
- bank_code |String |Account's bankCode. ([Link](https://en.wikipedia.org/wiki/List_of_banks_in_South_Korea))
- account_number|String |Account's number.
-  is_authenticated|Boolean |'true' if a user is authenticated.
email_info||User's email information.
- is_authenticated |Boolean | 'true' if a user is authenticated.
- email |String 	|User's email address.
 fee_rates ||User's fee.
- btc | |User's fee.
- - maker |Float |Percent of BTC maker fee.
- - taker |Float 	|Percent of BTC taker fee.
- eth | |User's fee.
- - maker | Float |Percent of ETH maker fee.
- - taker|Float |Percent of ETH taker fee.
- etc | |User's fee.
- - maker |Float |Percent of ETC maker fee.
- - taker |Float |Percent of ETC taker fee.

- ACCOUNT V2 / Balance
```ruby
user =  Coinone::Account.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

balance = user.get_balance

```


- ACCOUNT V2 / Daily Balance
- ACCOUNT V2 / Deposit Address
- ACCOUNT V2 / Virtual Account

#### OAUTH

- OAUTH / Delete Access Token
- OAUTH / Get Access Token
- OAUTH / Get Request  Token
- OAUTH / Refresh Access Token

#### ORDER V2

- ORDER V2 / Cancel All Order
- ORDER V2 / Cancel Order
- ORDER V2 / Limit Buy
- ORDER V2 / Limit Sell
- ORDER V2 / Market Buy
- ORDER V2 / Market Sell
- ORDER V2 / My Complete Orders

#### PUBLIC

Not Need `ACCESS_TOKEN` and `SECRET_KEY`

- PUBLIC / Currency
```ruby
currency =  Coinone::Public.get_currency


```

AttributeName |  Class | Description
----------- | ------------- | -------------
result | String | Request's result
currency|Float |Currency Rate.
currency_type |String | Currency Type. Ex) USD, KRW..


- PUBLIC / Orderbook
```ruby
orderbook =  Coinone::Public.get_orderbook # Default "BTC"

btc_orderbook =  Coinone::Public.get_orderbook(currency: "btc") # BTC Orderbook

eth_orderbook =  Coinone::Public.get_orderbook(currency: "eth") # ETH Orderbook

etc_orderbook =  Coinone::Public.get_orderbook(currency: "etc") # ETC Orderbook

```
AttributeName |  Class | Description
----------- | ------------- | -------------
result | String | Request's result
ask |Array|Ask List.
- price|Integer|Ask KRW price.
- qty|Float|Ask BTC(or ETH, ETC) quantity.
bid|Array|Bid List.
- price |Integer|Bid KRW price.
 - qty|Float|Bid BTC(or ETH, ETC) quantity.
timestamp|Integer|Timestamp.
currency|String |Currency.


- PUBLIC / Recent Complete Orders
```ruby
complete_orders =  Coinone::Public.get_complete_orders # Default "BTC" and "Hour"

btc_hour_complete_orders =  Coinone::Public.get_complete_orders(currency: "btc", period: "hour") # BTC and Hour Complete Orders

btc_day_complete_orders =  Coinone::Public.get_complete_orders(currency: "btc", period: "day") # BTC and Day Complete Orders

eth_hour_complete_orders =  Coinone::Public.get_complete_orders(currency: "eth", period: "hour") # ETH and Hour Complete Orders

eth_day_complete_orders =  Coinone::Public.get_complete_orders(currency: "eth", period: "day") # ETH and Day Complete Orders

etc_hour_complete_orders =  Coinone::Public.get_complete_orders(currency: "etc", period: "hour") # ETC and Hour Complete Orders

etc_day_complete_orders =  Coinone::Public.get_complete_orders(currency: "etc", period: "day") # ETC and Hour Complete Orders 

```
AttributeName |  Class | Description
----------- | ------------- | -------------
result | String | Request's result
completeOrders |Array|Recent complete orders.
- price|Integer|Ask KRW price.
- qty|Float|BTC(or ETH, ETC) quantity.
- timestamp|Integer|Timestamp.
timestamp|Integer|Timestamp.
currency|String |Currency.



- PUBLIC / Ticker
```ruby
ticker =  Coinone::Public.get_ticker # Default "BTC"

btc_ticker =  Coinone::Public.get_ticker(currency: "btc") # BTC Ticker

etc_ticker =  Coinone::Public.get_ticker(currency: "etc") # ETH Ticker

etc_ticker =  Coinone::Public.get_ticker(currency: "etc") # ETC Ticker

all_ticker =  Coinone::Public.get_ticker(currency: "all") # ALL Ticker

```

#### TRANSACTION V2 

- TRANSACTION V2 / 2-Factor Authentication
- TRANSACTION V2 / Coin Transactions History
- TRANSACTION V2 / KRW Transactions History
- TRANSACTION V2 / Send Coin


## ToDo
- [x] ACCOUNT V2 / Account Infomation
- [x] ACCOUNT V2 / Balance
- [ ] ACCOUNT V2 / Daily Balance
- [ ] ACCOUNT V2 / Deposit Address
- [ ] ACCOUNT V2 / Virtual Account

- [ ] OAUTH / Delete Access Token
- [ ] OAUTH / Get Access Token
- [ ] OAUTH / Get Request  Token
- [ ] OAUTH / Refresh Access Token

- [ ] ORDER V2 / Cancel All Order
- [ ] ORDER V2 / Cancel Order
- [ ] ORDER V2 / Limit Buy
- [ ] ORDER V2 / Limit Sell
- [ ] ORDER V2 / Market Buy
- [ ] ORDER V2 / Market Sell
- [ ] ORDER V2 / My Complete Orders
- [ ] ORDER V2 / My Limit Orders

- [x] PUBLIC / Currency
- [x] PUBLIC / OrderBook
- [x] PUBLIC / Recent Complete Orders
- [x] PUBLIC / Ticker

- [ ] TRANSACTION V2 / 2-Factor Authentication
- [ ] TRANSACTION V2 / Coin Transactions History
- [ ] TRANSACTION V2 / KRW Transactions History
- [ ] TRANSACTION V2 / Send Coin

## Full documentation 

The Documentation is at [Coinone Docs](http://doc.coinone.co.kr/)

## Change Log

Current Version 0.3.0

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
- Ξ ETH : 0xba920569e0a24459dbf5b2fcab9adf3e4a41b918
- ETC : 0xc45b10108920b5f20e574bbf021e73d93af5dbc8


