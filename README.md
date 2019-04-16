# Ccfg

Command line tool to generate C/C++ configure files (config.h.in => config.h).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ccfg'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ccfg

## Usage

    $ ls
    header.h.in
    $ cat header.h.in
    // Just example defines
    #gemdefine FOO @FOO@
    #gemdefine BAR @BAR@
    #gemdefine FOOBAR @FOOBAR@
    $ ccfg header.h.in FOO BAR=1
    // Just example defines
    #define FOO
    #define BAR 1
    /* #undef FOOBAR */

For output to file use option `-o`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ccfg. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

