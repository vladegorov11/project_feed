class SearchFilter
   def initialize (filter)
     @filter = filter
   end

   def scope
     @feeds = Feed.all
     unless @filter.instance_of? String
       @feeds = get_title_search(@feeds, @filter[:title_search]) unless @filter[:title_search].blank?
       @feeds =  get_cetegory(@feeds) unless @filter[:category].blank?
       @feeds = get_date(@feeds) unless @filter[:start_date].blank? || @filter[:end_date].blank?
     else
       @feeds = get_title_search(@feeds,@filter) 
     end
     return @feeds
   end

   private

   def get_cetegory(feeds)
     @categories = Category.joins(:sources).find( @filter[:category])
     @arr = @categories.map(&:sources).map(&:ids).uniq
     feeds = feeds.order("created_at DESC").where(source_id: @arr)
   end

   def get_date(feeds)
    feeds = feeds.where("created_at >= :start_date ",
      {start_date: @filter[:start_date]}) unless @filter[:start_date].blank?
    feeds = feeds.where("created_at <= :end_date",
      { end_date: @filter[:end_date]}) unless @filter[:end_date].blank?
   end

   def get_title_search(feeds, search_value)
    puts search_value
     feeds.search("#{search_value}").records.all
   end
end
