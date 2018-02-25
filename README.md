# ActiveRecordAnalyzer

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/active_record_analyzer`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_record_analyzer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_record_analyzer

## Usage

You can analyze your ActiveRecord model with the analyzer:

```ruby
analyzer = ActiveRecordAnalyzer::Analyzer.new(User)
```

With the analyzer in place, given an attribute's name, you can get its type for the given class (`User` in the example):

```ruby
attribute = analyzer.reflect(:name)
attribute.association?      # => false
attribute.simple_attribute? # => true
```

### Simple attributes

A **Simple Attribute** means basically every attribute except of foreign keys.

```ruby
analyzer.reflect(:name).simple_attribute?       # => true
analyzer.reflect(:created_at).simple_attribute? # => true
analyzer.reflect(:company_id).simple_attribute? # => false
analyzer.reflect(:company).simple_attribute?    # => false
analyzer.reflect(:accounts).simple_attribute?   # => false
```

### Associations

An **Association** means foreign keys and association names.

```ruby
analyzer.reflect(:name).simple_attribute?       # => false
analyzer.reflect(:created_at).simple_attribute? # => false
analyzer.reflect(:company_id).simple_attribute? # => true
analyzer.reflect(:company).simple_attribute?    # => true
analyzer.reflect(:accounts).simple_attribute?   # => true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/active_record_analyzer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

