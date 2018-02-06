require 'koala'
class FacebookApi

  @@conntent_type = 'fb'

  def initialize
    #oauth = Koala::Facebook::OAuth.new
    @graph = Koala::Facebook::API.new
  end

  def get_events
    events = @graph.search('днепр', type: :event, limit: 1)
    data = Formatter.super_format(events, @@conntent_type)
  end
end
