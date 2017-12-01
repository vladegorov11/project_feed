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

  def test
    html = open("https://www.igromania.ru/news/72255/Destiny_2_poluchit_besplatnuyu_demoversiyu.html")
    doc = Nokogiri::HTML(html)
    description = doc.css(".opinion")
    #image = doc.css(".main_pic_container")
    return description
  end
end
