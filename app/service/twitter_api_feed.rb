require 'twitter'
require 'json'
class TwitterApiFeed
  @@conntent_type = 'tweets'
  def initialize(user)
  @user = user
  @client =  Twitter::REST::Client.new do |config|
      config.consumer_key = "SO2qkuI4gT8F0Xy2Djmt0lDNF"
      config.consumer_secret = 'qb3S83YjjoYFyG3BDQCNy5IWJW1l3ARDZTRT49C44ynIuyaG6F'
      config.access_token = user.twitter_token
      config.access_token_secret = user.twitter_token_secret
    end
  end

  def get_home_timeline
    tweets_list = @client.home_timeline
    tweets_list.each do |tweet|
      if Tweet.where(["tweet_id = ? " , tweet.id]).blank?
        Formatter.super_format(tweet, @@conntent_type, '' , @user )
      end
    end
  end

end
