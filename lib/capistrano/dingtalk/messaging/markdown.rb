require_relative 'base'

module Capistrano::Dingtalk::Messaging
  class Markdown < Base
    def initialize(info)
      @info = info || {}
    end

    def markdown_load(action)
      "
      ### #{application}
      action: #{action}
      deployer: `#{deployer}`
      branch: `#{branch}`
      stage: `#{stage}`"
    end

    ################################################################################

    def markdown(action)
      method = "message_for_#{action}"
      respond_to?(method) && send(method)
    end

    def build_hash(action)
      {
        msgtype: "markdown",
        markdown: {
          title: message_for(action),
          text: markdown_load(action)
        }
      }
    end
  end
end
