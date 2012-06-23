gem 'minitest'
require 'minitest/autorun'

require 'tempfile'

require 'vcr'

require_relative '../lib/triphthong'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr'
  config.default_cassette_options = { record: :new_episodes }
  config.hook_into :fakeweb
end
