module Api
  module V1
    class FeedsController < ApplicationController
      def index
         @feeds = Feed.order('created_at DESC')
      end
    end
  end
end
