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

    def markdown_updating
      "#{deployer} has started deploying branch #{branch} of #{application} to #{stage}"
    end

    def markdown_reverting
      "#{deployer} has started rolling back branch #{branch} of #{application} to #{stage}"
    end

    def markdown_updated
      "#{deployer} has finished deploying branch #{branch} of #{application} to #{stage}"
    end

    def markdown_reverted
      "#{deployer} has finished rolling back branch of #{application} to #{stage}"
    end

    def markdown_failed
      "#{deployer} has failed to #{deploying? ? 'deploy' : 'rollback'} branch #{branch} of #{application} to #{stage}"
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
          text: markdown_for(action)
        }
      }
    end

    def markdown_for(action)
      method = "markdown_for_#{action}"
      respond_to?(method) && send(method)
    end
  end
end
