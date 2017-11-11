# Party::Parrot::Formatter

PartyParrot RSpec3 results formatter. [All hail the party parrot!](http://cultofthepartyparrot.com/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'party-parrot-formatter', group: [:test]
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install party-parrot-formatter



## Usage

To run rspec suite with this formatter use:

    $ rspec spec -f PartyParrotFormatter

Or add it to `.rspec` file:

    # PROJECT_ROOT/.rspec
    --format PartyParrotFormatter
    --color


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rspec spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. You can also run `rspec demo.rb` to see example.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Kudos

Hugely influenced by awesome gem [Nyan Cat Formatter](https://github.com/mattsears/nyan-cat-formatter) by Matt Sears.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jadrol/party-parrot-formatter.


## License

The gem is available as open source under the terms of the [Beerware license](https://en.wikipedia.org/wiki/Beerware).

