# Coinone
[![GemVersion](https://badge.fury.io/rb/coinone.svg)](https://badge.fury.io/rb/coinone) ![](http://ruby-gem-downloads-badge.herokuapp.com/coinone?type=total)  [![Code Climate](https://lima.codeclimate.com/github/ggomagundan/coinone/badges/gpa.svg)](https://lima.codeclimate.com/github/ggomagundan/coinone) 
[![Build Status](https://travis-ci.org/ggomagundan/coinone.svg?branch=master)](https://travis-ci.org/ggomagundan/coinone)[![GitHub issues](https://img.shields.io/github/issues/ggomagundan/coinone.svg)](https://github.com/ggomagundan/coinone/issues) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/ggomagundan/coinone/master/LICENSE.txt)

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

user.get_user_info

```

#### OAUTH

#### ORDER V2

#### PUBLIC

Not Need `ACCESS_TOKEN` and `SECRET_KEY`

- PUBLIC / Currency
```ruby
currency =  Coinone::Public.get_currency


```

- PUBLIC / Orderbook
```ruby
orderbook =  Coinone::Public.get_orderbook # Default "BTC"

btc_orderbook =  Coinone::Public.get_orderbook(currency: "btc") # BTC Orderbook

eth_orderbook =  Coinone::Public.get_orderbook(currency: "eth") # ETH Orderbook

etc_orderbook =  Coinone::Public.get_orderbook(currency: "etc") # ETC Orderbook

```


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

- PUBLIC / Ticker
```ruby
ticker =  Coinone::Public.get_ticker # Default "BTC"

btc_ticker =  Coinone::Public.get_ticker(currency: "btc") # BTC Ticker

etc_ticker =  Coinone::Public.get_ticker(currency: "etc") # ETH Ticker

etc_ticker =  Coinone::Public.get_ticker(currency: "etc") # ETC Ticker

all_ticker =  Coinone::Public.get_ticker(currency: "all") # ALL Ticker

```

#### TRANSACTION V2 

## ToDo
- [x] ACCOUNT V2 / Account Infomation
- [ ] ACCOUNT V2 / Balance
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

Current Version 0.2.1

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

- BTC : 16MdVNJgvGYbVuaC6KrjGNy2RCrNsaPaZz
- ETH : 0xba920569e0a24459dbf5b2fcab9adf3e4a41b918
- ETC : 0xc45b10108920b5f20e574bbf021e73d93af5dbc8


