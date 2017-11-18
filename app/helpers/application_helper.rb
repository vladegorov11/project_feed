module ApplicationHelper
  def new_feed_count(user)
      feeds = Feed.where(source_id: user.sourse_mass_id)
        .where( "created_at >= :end_date", end_date: user.last_visit)
      feeds.size
  end

  def twitter_token_present?
    if user_signed_in?
      unless current_user.twitter_token.blank? && current_user.twitter_token_secret.blank?
        true
      else
        false
      end
    end
  end
end
