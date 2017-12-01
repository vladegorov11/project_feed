class CategoriesController < ApplicationController
 before_action :set_category, only: [:show]
 before_action :top_feeds, only: :show
 def show
   @feeds = Feed.where(source_id: @category.sources.ids).order("created_at DESC").
     paginate(:page => params[:page], :per_page => 20)
 end


 private

 def set_category
   @category = Category.find(params[:id])
 end

end
