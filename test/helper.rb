require 'minitest/autorun'

require 'dotenv/load'

require 'rest-client'
require 'openssl'
require 'addressable/uri'
require 'base64'
require 'json'

require 'bigdecimal'
require 'bigdecimal/util'

require 'coinone'

class Minitest::Test
  @@data_path = File.expand_path(File.join(File.dirname(__FILE__), 'sample_data'))
end
