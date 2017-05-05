module Capistrano::Dingtalk::Messaging
  module Helpers

    def username
      'cap-dingtalk-bot'
    end

    def deployer
      ENV['USER'] || ENV['USERNAME']
    end

    def branch
      fetch(:branch)
    end

    def application
      fetch(:application)
    end

    def stage(default = 'an unknown stage')
      fetch(:stage, default)
    end

    #
    # Return the elapsed running time as a string.
    #
    # Examples: 21-18:26:30, 15:28:37, 01:14
    #
    def elapsed_time
      `ps -p #{$$} -o etime=`.strip
    end

  end
end
