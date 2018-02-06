class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :user_activity
  add_flash_types :success, :danger, :info

  private

  def user_activity
    current_user.try :touch
  end
  
  def top_feeds
    time =  Time.now - (60 * 60 * 24)
    @top_feeds = Feed.where("created_at >= :time", time: time ).order("view_count DESC").first(10)
  end

end
