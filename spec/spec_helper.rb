$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'vcr'
require 'webmock'
require "codeclimate-test-reporter"
require 'simplecov'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.ignore_hosts 'codeclimate.com'
end

SimpleCov.start do
  formatter SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::HTMLFormatter,
      CodeClimate::TestReporter::Formatter
    ]
  )
end

require 'rakuten_rms'
