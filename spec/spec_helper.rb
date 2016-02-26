$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'vcr'
require 'webmock'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

require 'rakuten_rms'
