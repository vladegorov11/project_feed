require 'twitter'
class FeedsController < ApplicationController
 before_action :authenticate_user!, except: [:index, :show, :search]
 before_action :set_feed, only: [:destroy, :show, :edit, :favorite]

  def index
    @sourse = Source.all
    @feeds  = Feed.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
    @caterories = Category.all
  end

  def show
    @categories = Category.all.order("view_count DESC")
    add_view_to_feed(@feed)
  end

  def new
    @feed = Feed.new
  end

  def my_feeds
      @feeds = Feed.where(source_id: current_user.sourse_mass_id ).order("created_at DESC")
        .paginate(:page => params[:page], :per_page => 20)
      last_seen
  end

  def favorite
     add_or_destroy_favorite(@feed)
  end


  def search
      @feeds = Feed.search("#{params[:title_search]}").records.all.
        paginate(:page => params[:page], :per_page => 20)  unless params[:title_search].blank?
      # @feeds = Feed.order("created_at DESC")
      # @feeds = @feeds.where("source_id = ?", params[:source_id] ) unless params[:source_id].blank?
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

  def create
    @feed = Feed.new(feed_params)
    respond_to do |format|
      if @feed.save
        format.html { redirect_to feed_path(@feed), success: 'Новость успешно создона.' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new, danger: 'Новость не создона '  }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to feed_path(@feed), success: 'Новость успешно обновлена.' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit, danger: 'Новость не добавлена.' }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
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

  def feed_params
    time_now = Time.now
    source = Source.where(["default_source = ? " , true ])
    params.require(:feed).permit(:title, :link, :data_time, :description, :full_description, :source_id, :image)
  end

  def add_or_destroy_favorite (feed)
    if current_user.feeds.ids.include?(feed.id)
      current_user.feeds.delete(feed)
      redirect_to feed_url(feed), success: "Новость удалина из избранных"
    else
      current_user.feeds.push feed
      redirect_to feed_url(feed), success: "Новость добавлена в избраное"
    end
  end

  def add_view_to_feed (feed)
    feed = feed.increment(:view_count)
    feed.save
    feed.source.categories.each do |category|
      category.increment(:view_count)
      category.save
    end
  end

  def last_seen
    @user = current_user
    @user.last_visit = Time.now
    @user.save
  end

end
