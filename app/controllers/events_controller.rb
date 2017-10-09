class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_event, only: [:destroy, :show, :edit, :favorite]

  def index
     @events = Event.all
     new_events
  end

  def show

  end

  def edit

  end
  private

    def set_event
      @event = Event.find(current_user.id)
    end

    def new_events
      require 'koala'
      #oauth = Koala::Facebook::OAuth.new
      @graph = Koala::Facebook::API.new
      #(oauth.get_app_access_token)
      profile = @graph.search('днепр', type: :event)
         profile.each do |fb_event|
            #  puts  fb_event["place"]["location"]["street"]
            begin
              puts fb_event["place"]["location"]["street"]
              puts fb_event["place"]["location"]["city"]
              puts fb_event ["name"]
            rescue
              puts "ничего"
            end
         end
      #puts profile
      puts "hi"
    end
end
