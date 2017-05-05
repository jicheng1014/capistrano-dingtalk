require 'rest-client'
require "capistrano/dingtalk/version"
require 'forwardable'

# load File.expand_path("../tasks/dingtalk.rake", __FILE__)

module Capistrano
  class Dingtalk
    extend Forwardable
    def_delegators :env, :fetch, :run_locally

    def initialize(env)
      @env = env
      @config = fetch(:dingtalk_info, {})
    end

    def run(action)
      run_locally {

      }
    end

    def send_msg_to_ding_talk(url, dict)
      RestClient.post(url, dict)
    rescue => e
      warn "DINGTALK ERROR: #{e.message}\n #{e.inspect}"
    end
  end
end
