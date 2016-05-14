require 'json_schema'
require 'rspec/core'
require 'active_support'
require 'active_support/core_ext/object/try'
require 'rspec/core'
require 'rspec/json_schema/match_schema'
require 'rspec/json_schema/version'

module RSpec
  module JsonSchema
    def it_follows_json_schema(schema)
      it "follows #{schema} json" do
        expect(last_response.body).to match_schema(schema)
      end
    end
  end
end

RSpec.configure do |rspec|
  rspec.extend RSpec::JsonSchema
  rspec.backtrace_exclusion_patterns << %r(/lib/rspec/json_schema)
end

RSpec::SharedContext.send(:include, RSpec::JsonSchema)
