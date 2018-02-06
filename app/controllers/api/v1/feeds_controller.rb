module Api
  module V1
    class FeedsController < ApplicationController

      def index
         @feeds = Feed.order('created_at DESC').first(5)
      end

      def search
         @feeds = SearchFilter.new(params[:title_search]).scope if params[:title_search]
         #@feeds = Feed.all.first(5)
      end

    end
  end
end
