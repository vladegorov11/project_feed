require 'koala'
class FacebookApi

    @@conntent_type = 'fb'

    def initialize
      #oauth = Koala::Facebook::OAuth.new
      @graph = Koala::Facebook::API.new
    end

    def get_events
         events = @graph.search('днепр', type: :event, limit: 1)
          #  events.each do |fb_event|
          #    puts fb_event
          #    puts "======================================================="
          #  end
          #      puts fb_event["place"]
                 data = Formatter.super_format(events, @@conntent_type)
                 #save = Writter.new
                 #save.save_to_event(data)
        #   end
    end

end
