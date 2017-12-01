class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :user_activity
  add_flash_types :success, :danger, :info

  private

  def user_activity
    current_user.try :touch
  end
  
  def top_feeds
    @top_feeds = Feed.order("view_count DESC").first(10)
  end

end
