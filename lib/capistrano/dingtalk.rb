require 'rest-client'
require_relative "dingtalk/version"
require_relative "dingtalk/Messaging/base"
require_relative "dingtalk/Messaging/text"
require_relative "dingtalk/Messaging/markdown"
require 'forwardable'

load File.expand_path("../tasks/dingtalk.rake", __FILE__)

module Capistrano
  class Dingtalk
    extend Forwardable
    def_delegators :env, :fetch, :run_locally

    attr_reader :message
    def initialize(env)
      @env = env
      @config = fetch(:dingtalk_info, {})
      # TODO: supports more message categories
      klass = message_klass
      @message = klass.new @config
    end

    def run(action)
      local = self
      run_locally do
        info "begin to send action #{action} to Dingtalk"
        json = local.message.build_msg_json(action)
        local.send(:send_msg_to_ding_talk, json)
      end
    end

    def send_msg_to_ding_talk(json)
      url = @config[:url]
      RestClient.post(url, json, content_type: :json, accept: :json)
    end

    def message_klass
      category = @config[:category] || 'text'
      klass = Object
      case category
      when 'text'
        klass = ::Capistrano::Dingtalk::Messaging::Text
      when 'markdown'
        klass = ::Capistrano::Dingtalk::Messaging::Markdown
      end
      klass
    end
  end
end
