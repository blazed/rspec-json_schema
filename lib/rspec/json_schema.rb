require 'rspec/json_schema/match_schema'
require 'rspec/json_schema/version'
require 'rspec/core'

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

RSpec::SharedContext.send(:include, Rspec::JsonSchema)
