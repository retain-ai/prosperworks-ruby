# ProsperWorks-Ruby

A lightweight wrapper for interacting with the [ProsperWorks Developer API](https://www.prosperworks.com/developer_api).

[![Build Status](https://travis-ci.org/soccernee/prosperworks-ruby.svg?branch=master)](https://travis-ci.org/soccernee/prosperworks-ruby)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prosperworks-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install prosperworks-ruby

## Usage

This gem offers basic operations to interact with the ProsperWorks Developer API. There is minimal error handling and no validation logic.

To use the proper credentials, the following must be run before using the gem:

```
ProsperWorks.configure do |config|
  config.user_email = <your_user_email>
  config.access_token = <your_api_token>
end
```

### Create

```
person = ProsperWorks::Person.create(attributes)

opportunity = ProsperWorks::Opportunity.create({
  pipeline_id: <some_id>,
  company_id: <another_id>,
  monetary_value: 1_000
})

```

### Find

```
person = ProsperWorks::Person.find(id)

lead = ProsperWorks::Lead.find(423)
```

### Update

For update, either update the object in advance:

```
person.name = "A New Name"
response = ProsperWorks::Person.update(person)
```

or pass in a hash of attributes to update:

```
attributes = {
  name: "A New Name"
}
response = ProsperWorks::Person.update(person, attributes)

```

### Delete

```
response = ProsperWorks::Person.delete(person.id)

```
### Search

```
response = ProsperWorks::Person.search(name: "John Doe")
```

### List

```
webhooks = ProsperWorks::Webhook.list
```

The following entity types are currently supported for create, find, update, delete and search:
* Person
* Lead
* Company
* Opportunity
* Task
* Project

The following entity types are currently supported for list:
* Customer Source
* Pipeline
* Pipeline Stage
* Webhook
* CustomFieldDefinition

The response will either be an instance of `ProsperWorks::Errors`, or the entity itself. See the `handle_response` function in [connect.rb](lib/prosperworks/api_operations/connect.rb).


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

This gem is fairly new, and can benefit from contributions!

You can take a look at the [issues](https://github.com/soccernee/prosperworks-ruby/issues) and start by contributing there.

Wishlist
- [X] continuous integration setup
- [X] add [Rubocop](https://github.com/bbatsov/rubocop)
- [ ] code cleanup & refactoring
- [ ] improved testing
- [X] search endpoint
- [ ] Users API
- [ ] Activities API
- [ ] Related Items API
- [ ] Secondary Resources APIs
- [ ] Support for Nested Resources


Bug reports and pull requests are welcome on GitHub at https://github.com/soccernee/prosperworks-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

To run the tests:
```
rake test
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Prosperworks::Ruby project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/soccernee/prosperworks-ruby/blob/master/CODE_OF_CONDUCT.md).
