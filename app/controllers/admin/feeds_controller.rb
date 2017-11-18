class Admin::FeedsController < Admin::AdminController
   before_action :set_feed, only: [:destroy]
    def update_news
       get_rss
       respond_to do |format|
         format.html { redirect_to feeds_url, success: 'Новости успешно добавлены.' }
         format.json { head :no_content }
       end
    end

    def edit

    end
    def destroy
      @feed.destroy
      respond_to do |format|
        format.html { redirect_to feeds_url, success: 'Новость успешно удалена' }
        format.json { head :no_content }
      end
    end
    private

    def set_feed
        @feed = Feed.find(params[:id])
    end

end
