require 'rake'
namespace :background_process do
  desc "TODO"
  task :update_tweets => :environment do
    TwitterWorker.perform_async()
  end

  desc "TODO"
  task :my_task2 => :environment do
  end
end
