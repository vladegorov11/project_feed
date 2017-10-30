class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :user_activity

  private
  
  def user_activity
    current_user.try :touch
  end
end
