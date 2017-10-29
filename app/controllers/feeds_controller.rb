class FeedsController < ApplicationController
   before_action :authenticate_user!, except: [:index, :show, :search]
   before_action :set_feed, only: [:destroy, :show, :edit, :favorite]

    def index
      # @rates = Rate.all
      @sourse = Source.all
        # if user_signed_in?
        #   @user  = current_user
        #   @feeds = Feed.where(source_id: @user.sourse_mass_id ).order("created_at DESC")
        #   @size  = @feeds.size
        # else
          @feeds  = Feed.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
          @size   = @feeds.size
        # end
    end

    def show
      @categories = Category.all.order("view_count DESC")
      @feed = @feed.increment(:view_count)
      @feed.save
      @feed.source.categories.each do |category|
        category.increment(:view_count)
        category.save
      end
      #  @user = User.find(current_user.id)
    end

    def my_feed
      if user_signed_in?
        @user  = current_user
        @feeds = Feed.where(source_id: @user.sourse_mass_id ).order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
        @size  = @feeds.size
        @user.last_visit = Time.now
        @user.save
      end
    end

    def favorite
      @user = current_user
      if @user.feeds.ids.include?(@feed.id)
         puts "новость уже в избраном"
         @user.feeds.delete(@feed)
         redirect_to feed_url(@feed), :notice => "Новость удалина из избранных"
      else
        @user.feeds.push @feed
         redirect_to feed_url(@feed), :notice => "Новость добавлена в избраное"
      end
    end


    def search
        @feeds = Feed.search("#{params[:title_search]}").records.all.
          paginate(:page => params[:page], :per_page => 20)  unless params[:title_search].blank?
        # @feeds = Feed.order("created_at DESC")
        # @feeds = @feeds.where("source_id = ?", params[:source_id] ) unless params[:source_id].blank?
        # @feeds = @feeds.where(["title  LIKE ? ", "%#{params[:title_search]}%"]) unless params[:title_search].blank?
        #@sourse = Source.all
    end

    def update_news
       get_rss
       respond_to do |format|
         format.html { redirect_to feeds_url, notice: 'Новости успешно добавлены.' }
         format.json { head :no_content }
       end
    end

    def edit

    end
    def destroy
      @feed.destroy
      respond_to do |format|
        format.html { redirect_to feeds_url, notice: 'Feed was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    private

    def set_feed
        @feed = Feed.find(params[:id])
    end

    # def  get_rss
    #
    #   RSSGetter.get_all
    #   require 'rss'
    #   require 'open-uri'
    #   require 'nokogiri'
    #   rss_results = []
    #   rss_sourse = Source.all
    #   rss_sourse.each do |sourse_url|
    #     @sors_url = sourse_url
    #     rss = RSS::Parser.parse(open(@sors_url.api_url).read, false).items[0..1]
    #     puts sourse_url.api_url
    #     rss.each do |result|
    #           url = result.link
    #           html = open(url)
    #           doc = Nokogiri::HTML(html)
    #           description = doc.css(@sors_url.description_url)
    #             result
    #             begin
    #               result = { title: result.title,
    #                          date: result.pubDate,
    #                          link: result.link,
    #                          description: result.description ,
    #                          full_description: description ,
    #                          image: result.enclosure.url }
    #             rescue
    #               result = { title: result.title,
    #                          date: result.pubDate,
    #                          link: result.link,
    #                          description: result.description ,
    #                          full_description: description ,
    #                          image: "http://pravlife.org/sites/default/files/field/image/225353843.jpg" }
    #             end
    #
    #           rss_results.push(result)
    #
    #         end
    #             @rss_news =  rss_results
    #
    #             @rss_news.each do |article|
    #               @my_feed = Feed.all
    #               @my_feed = @my_feed.where(["link = ? " , article[:link]])
    #                   if  @my_feed.blank?
    #                       @save_feed = Feed.new
    #                       @save_feed.title = article[:title]
    #                       @save_feed.data_time = article[:date]
    #                       @save_feed.link = article[:link]
    #                       @save_feed.image = article[:image]
    #                       @save_feed.description = article[:description]
    #                       @save_feed.full_description = article[:full_description]
    #                       @save_feed.source_id = @sors_url.id
    #                       @save_feed.save
    #                   else
    #                       puts "новость уже есть"
    #                   end
    #             end
    #      end
    # end
end
