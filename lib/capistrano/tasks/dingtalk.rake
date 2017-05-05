namespace :dingtalk do
  namespace :deploy do
    desc 'Notify about updating deploy'
    task :updating do
      Capistrano::Dingtalk.new(self).run(:updating)
    end

    desc 'Notify about reverting deploy'
    task :reverting do
      Capistrano::Dingtalk.new(self).run(:reverting)
    end

    desc 'Notify about updated deploy'
    task :updated do
      Capistrano::Dingtalk.new(self).run(:updated)
    end

    desc 'Notify about reverted deploy'
    task :reverted do
      Capistrano::Dingtalk.new(self).run(:reverted)
    end

    desc 'Notify about failed deploy'
    task :failed do
      Capistrano::Dingtalk.new(self).run(:failed)
    end

    desc 'Test Slack integration'
    task test: %i[updating updated reverting reverted failed] do
      # all tasks run as dependencies
    end
  end
end

before 'deploy:updating',           'slack:deploy:updating'
before 'deploy:reverting',          'slack:deploy:reverting'
after  'deploy:finishing',          'slack:deploy:updated'
after  'deploy:finishing_rollback', 'slack:deploy:reverted'
after  'deploy:failed',             'slack:deploy:failed'
