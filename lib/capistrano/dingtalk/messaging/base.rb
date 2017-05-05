require 'forwardable'
require 'json'
require_relative 'helpers'

module Capistrano::Dingtalk::Messaging
  class Base
    include Helpers
    extend Forwardable
    def_delegators :env, :fetch

    def initialize(info)
      @info = info || {}
    end

    def message_for_updating
      "#{deployer} has started deploying branch #{branch} of #{application} to #{stage}"
    end

    def message_for_reverting
      "#{deployer} has started rolling back branch #{branch} of #{application} to #{stage}"
    end

    def message_for_updated
      "#{deployer} has finished deploying branch #{branch} of #{application} to #{stage}"
    end

    def message_for_reverted
      "#{deployer} has finished rolling back branch of #{application} to #{stage}"
    end

    def message_for_failed
      "#{deployer} has failed to #{deploying? ? 'deploy' : 'rollback'} branch #{branch} of #{application} to #{stage}"
    end

    ################################################################################

    def message_for(action)
      method = "message_for_#{action}"
      respond_to?(method) && send(method)
    end

    def build_at_dict
      at = {}
      at["at"] = @info[:at_all]
      at["atMobiles"] = @info[:at_mobiles]
      at.compact
    end

    def build_hash(action)
      # implements on children
    end

    def build_msg_json(action)
      build_hash(action).merge(build_at_dict).to_json
    end
  end
end
