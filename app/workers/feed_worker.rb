class FeedWorker
  include Sidekiq::Worker

  def perform()
    FeedRss.get_rss
  end
  
end
