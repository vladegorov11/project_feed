class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    twitter_oauth_keys =  request.env['omniauth.auth'].to_h
    if current_user.twitter_token.blank? && current_user.twitter_token_secret.blank?
      save_oauth_keys(twitter_oauth_keys["credentials"]["token"], twitter_oauth_keys["credentials"]["secret"])
    end
  end
  
  private

  def save_oauth_keys(token, secret)
     current_user.update(twitter_token: token, twitter_token_secret: secret)
  end
end
