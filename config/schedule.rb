#job_type :sidekiq, "cd :path && :environment_variable=:environment bundle exec sidekiq-client push :task :output"
#job_type :sidekiq, "cd :path && RAILS_ENV=:environment /usr/local/bin/bundle exec /usr/local/bin/sidekiq-client :task :output "
# job_type :sidekiq, "cd :path && :environment_variable=:environment  ':task' :output"
set :output, error: 'error.log', standard: 'cron.log'
set :environment , :development
env :PATH, ENV['PATH']

every 10.minutes do
  # sidekiq 'sidekiq-client push TwitterWorker'
  runner "TwitterWorker.perform_async()", :environment => :development
end

every 3.hours do
  runner "FeedWorker.perform_async()", :environment => :development
end

every 6.hours do
  runner "ExchangeRateWorker.perform_async()", :environment => :development
end