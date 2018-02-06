class TwitterWorker
  include Sidekiq::Worker

  def perform()
    User.where.not(twitter_token_secret: "", twitter_token: "" ).each do |user|
      TwitterApiFeed.new(user).get_home_timeline
    end
  end
  
end
