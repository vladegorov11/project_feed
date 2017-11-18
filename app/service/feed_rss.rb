require 'rss'
require 'open-uri'
require 'nokogiri'
class FeedRss
  @@conntent_type = 'rss'

  def get_rss
    rss_results = []
    rss_source = Source.where(["default_source = ? " , false ])
      rss_source.each do |source_url|
        @source_url = source_url
        rss = RSS::Parser.parse(open(@source_url.api_url).read, false).items[0..1]
        puts source_url.api_url
         rss.each do |result|
           url = result.link
           html = open(url)
           doc = Nokogiri::HTML(html)
           description = doc.css(@source_url.description_url)
           a = Formatter.super_format(result, @@conntent_type, description, @source_url)
         end
      end
  end

  # def get_description rss
  #     rss.each do |result|
  #       url = result.link
  #       html = open(url)
  #       doc = Nokogiri::HTML(html)
  #       description = doc.css(@sors_url.description_url)
  #       #
  #     end
  # end

end





# require 'rss'
# require 'open-uri'
# require 'nokogiri'
# rss_results = []
# rss_sourse = Source.all
# rss_sourse.each do |sourse_url|
# @sors_url = sourse_url
# rss = RSS::Parser.parse(open(@sors_url.api_url).read, false).items[0..1]
# puts sourse_url.api_url
      # rss.each do |result|
      #   url = result.link
      #   html = open(url)
      #   doc = Nokogiri::HTML(html)
      #   description = doc.css(@sors_url.description_url)
      #     result
      #     begin
      #       result = { title: result.title,
      #                  date: result.pubDate,
      #                  link: result.link,
      #                  description: result.description ,
      #                  full_description: description ,
      #                  image: result.enclosure.url }
      #     rescue
      #       result = { title: result.title,
      #                  date: result.pubDate,
      #                  link: result.link,
      #                  description: result.description ,
      #                  full_description: description ,
      #                  image: "http://pravlife.org/sites/default/files/field/image/225353843.jpg" }
      #     end
      #
      #   rss_results.push(result)
      # end
          # @rss_news =  rss_results
          #
          # @rss_news.each do |article|
          #   @my_feed = Feed.all
          #   @my_feed = @my_feed.where(["link = ? " , article[:link]])
          #       if  @my_feed.blank?
          #           @save_feed = Feed.new
          #           @save_feed.title = article[:title]
          #           @save_feed.data_time = article[:date]
          #           @save_feed.link = article[:link]
          #           @save_feed.image = article[:image]
          #           @save_feed.description = article[:description]
          #           @save_feed.full_description = article[:full_description]
          #           @save_feed.source_id = @sors_url.id
          #           @save_feed.save
          #       else
          #           puts "новость уже есть"
          #       end
          # end
  #  end
