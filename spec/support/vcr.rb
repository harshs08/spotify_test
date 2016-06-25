# WebMock.disable_net_connect!

VCR.configure do |config|
  config.cassette_library_dir = "factories/vcr_cassettes"
  config.hook_into :webmock
end