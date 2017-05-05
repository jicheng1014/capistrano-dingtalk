# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/dingtalk/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-dingtalk"
  spec.version       = Capistrano::Dingtalk::VERSION
  spec.authors       = ["atpking"]
  spec.email         = ["atpking@gmail.com"]

  spec.summary       = "ding talk capistrano plugin"
  spec.description   = "ding talk capistrano plugin, sending message to ding talk custom webhook rebot"
  spec.homepage      = "https://github.com/jicheng1014/capistrano-dingtalk"
  spec.license       = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "capistrano", ">= 3.5.0"
  spec.add_dependency "rest-client", ">= 1.5"
end
