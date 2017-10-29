module ApplicationHelper
  def new_feed_count(user)
      feeds = Feed.where(source_id: user.sourse_mass_id)
        .where( "created_at >= :end_date", end_date: user.last_visit)
      feeds.size
  end
end
