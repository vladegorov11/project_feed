class Formatter
  
  def format_tweets(tweet, user)
    Tweet.create( text: tweet.text,
                  url: tweet.url,
                  full_text: tweet.full_text,
                  user_name: tweet.user.name,
                  tweet_id: tweet.id,
                  user_url: tweet.user.url,
                  user_screen_name: tweet.user.screen_name,
                  user_id: user.id,
                  profile_image_url: tweet.user.profile_image_url)
  end 

  def format_exchange_rate(data)
    money_arr = ["USD", "RUB", "EUR"]
    data.each do |money|
      if money_arr.include?(money["cc"])
          Rate.create(name: money["txt"], date_time: money["exchangedate"], title: money["cc"], rate: money["rate"])
      end
    end
  end

  def format_facebook(data)
    data.each do |event|
       Event.create(start_time: event["start_time"],
                    description: event["description"],
                    title: event["name"],
                    link: 'https://www.facebook.com/events/' + event["id"],
                    city: event["place"]["location"],
                    end_time: event["end_time"] )
    end
  end

  def format_feed(data, description, source)
    begin
           result = { title: data.title,
                      data_time: data.pubDate,
                      link: data.link,
                      description: data.description ,
                      full_description: description ,
                      source_id: source.id ,
                      image: data.enclosure.url }
    rescue
          result = { title: data.title,
                     data_time: data.pubDate,
                     link: data.link,
                     description: data.description ,
                     full_description: description ,
                     source_id: source.id ,
                     image: "http://pravlife.org/sites/default/files/field/image/225353843.jpg" }
    end
    my_feed = Feed.all
    my_feed = my_feed.where(["link = ? " , result[:link]])
    if  my_feed.blank?
      Feed.create(result)
    end 
  end 
  
end