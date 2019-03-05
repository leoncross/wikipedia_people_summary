require 'simplecov'
require 'simplecov-console'
require 'webmock/rspec'

WebMock.allow_net_connect!

module ApiHelper
  def mock_api_call(name)
    stub_request(:get, /en.wikipedia.org/).with(
      headers: {
        'Accept' => '*/*', 'User-Agent' => 'Ruby'
      }
    ).to_return(
      status: 200,
      body: JSON.generate(name),
      headers: { 'Content-Type' => 'application/json' }
    )
  end
end
