class CategoriesController < ApplicationController
 before_action :set_category, only: [:show]

 def show
   @feeds = Feed.where(source_id: @category.sources.ids)
 end


 private

   def set_category
     @category = Category.find(params[:id])
   end

end
