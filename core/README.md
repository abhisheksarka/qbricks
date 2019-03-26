# Core

This holds all services and business logic. Connects to the db. Check usage section

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'core'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install core

## Usage

Make sure you have the following env variables set
```
QUBRICKS_DB_NAME
QUBRICKS_DB_HOST
QUBRICKS_DB_USER
QUBRICKS_DB_PASS
```

Start the gem console
$ bin/console

Connect to the db
```
Core.establish_connection
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/core. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Core project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/core/blob/master/CODE_OF_CONDUCT.md).
