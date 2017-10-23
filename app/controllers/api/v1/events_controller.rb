module Api
  module V1
    class EventsController < ApplicationController
      def index
        @events = Event.order('created_at DESC')
      end
    end
  end
end
