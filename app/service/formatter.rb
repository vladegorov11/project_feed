class Formatter

  def self.super_format (data, data_type, description = "", source = 1)
      case data_type

      when 'fb'
          data.each do |event|
                result = { start_time: event["start_time"],
                           description: event["description"],
                           title: event["name"],
                           city: event["place"]["location"],
                           end_time: event["end_time"] }
                Event.create(result)
          end
      when 'rss'
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
      when 'ER'
        money_arr = ["USD", "RUB", "EUR"]
          data.each do |money|
              if money_arr.include?(money["cc"])
                result = { name: money["txt"],
                           date_time: money["exchangedate"],
                           title: money["cc"],
                           rate: money["rate"]}
                Rate.create(result)
              end
          end
      end
   end
end
