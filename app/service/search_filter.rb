class SearchFilter
   def initialize (filter)
     @filter = filter
   end

   def scope
     @feeds = Feed.all
     puts @filter
     @feeds = get_title_search(@feeds) unless @filter[:title_search].blank?
     @feeds =  get_cetegory(@feeds) unless @filter[:category].blank?
     @feeds = get_date(@feeds) unless @filter[:start_date].blank? || @filter[:end_date].blank?
     return @feeds
   end

   private

   def get_cetegory(feeds)
     @categories = Category.joins(:sources).find( @filter[:category])
     @arr = @categories.map(&:sources).map(&:ids).uniq 
     feeds = feeds.order("created_at DESC").where(source_id: @arr)
   end

   def get_date(feeds)
    feeds.where( ":start_date <= created_at <= :end_date", start_date: @filter[:start_date], end_date: @filter[:end_date])
   end

   def get_title_search(feeds)
     feeds.search("#{@filter[:title_search]}").records.all #.paginate(:page => params[:page], :per_page => 20)
   end
end


