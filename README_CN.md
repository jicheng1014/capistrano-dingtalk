# Capistrano::Dingtalk

使用capistrano 的时候向dingtalk 发消息

## 依赖

- Capistrano >= 3.5.0
- Ruby >= 2.0


## 安装

在 Gemfile 中添加

```ruby
gem 'capistrano-dingtalk'
```

在Capfile 中添加

 ```ruby
 require 'capistrano/dingtalk'
 ```

## 配置

1. 去钉钉拿到webhook 机器人的地址
2. 向 `config/deploy.rb` 或者具体的环境文件里加以下配置

```ruby
set :dingtalk_info, {
  category: "text",  # 可选， 有 text  markdown 两种模式   ps 钉钉的markdown 好像只对手机端有效（2017年05月05日）
  url: 'https://oapi.dingtalk.com/robot/send?access_token=abcedf012345678', # 换成你的webhook 地址
  at_mobiles: [], # 可选，填 你要 at 的人的手机号
  at_all: false # 可选， 是否 at 所有人
}
```

如果有使用中的问题，欢迎提 issue 或者通过微信(atpking)与我取得联系

## 感谢

 `slackistrano` 项目。

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/capistrano-dingtalk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
