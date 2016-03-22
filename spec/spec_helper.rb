$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rspec/json_schema'

RSpec.configure do |config|
  config.order = 'random'
end
