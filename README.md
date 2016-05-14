# Rspec::JsonSchema
A simple gem that allows you to test (json) strings against a json schema.
It is supposed to be used along with RSpec for testing.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-json_schema'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-json_schema

## Usage
Add the following to your `rails_helper.rb` or `spec_helper.rb`.

```ruby
require 'rspec/json_schema'
```

Then in your test scenario you can use the `it_follows_json_schema(json-schema_path)` method:

```ruby
describe 'Catches API: :index', type: :api do
  before do
    5.times{ FactoryGirl.create(:video) }

    get api_v1_catches_path, format: :json
  end

  it_follows_json_schema('videos/index')
end
```
where `videos/index` regers to the `spec/schemas/videos/index.json` file.

# ToDo
- [ ] allow to setup the schemas default directory
- [ ] more testing

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/blazed/rspec-json_schema.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

