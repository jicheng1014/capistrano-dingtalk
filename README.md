# Capistrano::Dingtalk

send msg to ding talk webhook rebot when capistrano works.

## Requirements

- Capistrano >= 3.5.0
- Ruby >= 2.0


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-dingtalk'
```

Require the library in your application's Capfile:

 ```ruby
 require 'capistrano/dingtalk'
 ```

## configuration

1. get dingtalk webhook url. 
2. add config to `config/deploy.rb` or the stages files.

```ruby
set :dingtalk_info, {
  url: 'https://oapi.dingtalk.com/robot/send?access_token=abcedf012345678' # change to your url
  at_mobiles: [], # option
  at_all: false # option
}
```

if you have any question, contact me by Wechat (name: atpking).

## Thanks

Thanks to project `slackistrano` which could send msg to `slack.com`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/capistrano-dingtalk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
