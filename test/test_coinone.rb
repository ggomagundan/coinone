require 'helper'
require 'faraday'
class TestCoinone < Minitest::Test

  def setup

    @connection = Coinone::Connection.new(access_token: ENV['COINONE_ACCESS_TOKEN'], secret_key: ENV['COINONE_SECRET_KEY'])

  end

  def test_connection_access_token_and_secret_key
    assert_equal @connection.access_token, ENV['COINONE_ACCESS_TOKEN']
    assert_equal @connection.secret_key, ENV['COINONE_SECRET_KEY']
  end

  def test_setup_data_json

    setup_data_client("setup_data")
    response = @@sample_connection.get '/setup_data'
    data = JSON.parse(response.body, symbolize_names: true)

    assert_equal data[:result], "success"

  end

  protected

  def get_data_body(name)
    File.open(@@data_path + '/' + name + ".json").read
  end

  def setup_data_client(file_name)
    stubs = Faraday::Adapter::Test::Stubs.new
    @@sample_connection = Faraday.new do |builder|
      builder.adapter :test, stubs do |stub|
        stub.get("/#{file_name}") { |env| [200, {'Content-Type' => 'application/json'}, get_data_body(file_name)]}
      end
    end
  end

end
