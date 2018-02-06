module Api
  module V1
    class CategoriesController < ApplicationController

      def index
         @categories = Category.order('view_count DESC')
      end

      def show
        @category = Category.find(params[:id])
        @feeds = Feed.where(source_id: @category.sources.ids).order("created_at DESC").first(10)
      end
    end
  end
end