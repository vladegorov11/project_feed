class Admin::DashboardController < ApplicationController
  layout 'admin.html.erb'
  def index
    @categories = Category.order("view_count DESC")
    @all_category_count = @categories.inject(0){|sum,x| sum + x.view_count }
  end

end
