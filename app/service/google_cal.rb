require 'rubygems'
require 'google_calendar'
class GoogleCal
  def get_eve
    @cal = Google::Calendar.new(:client_id  => "392708814412-n5fafc1738ssergv7dem758iee83sq0a.apps.googleusercontent.com",
                             :client_secret => "_PN5D08idEZH0XaBq05L0VMn",
                             :calendar      => "vladxd228@gmail.com",
                             :redirect_url  => "urn:ietf:wg:oauth:2.0:oob" # this is what Google uses for 'applications'
                             )
  end

  def get_all_events
    @cal.events
  end
end
