require 'rss'
require 'open-uri'
require 'nokogiri'
class FeedRss

  def self.get_rss
    rss_source = Source.where(["default_source = ? " , false ])
    parse_rss(rss_source)
  end

  def self.parse_rss(rss_source)
    rss_source.each do |source_url|
      rss = RSS::Parser.parse(open(source_url.api_url).read, false).items[0..1]
      get_description(rss, source_url)
    end
  end

  def self.get_description(rss, source_url)
    rss.each do |result|
      description = Nokogiri::HTML(open(result.link)).css(source_url.description_url)
      Formatter.new.format_feed(result, description, source_url)
    end
  end

end
