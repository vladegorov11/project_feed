require 'twitter'
class FeedsController < ApplicationController
 before_action :authenticate_user!, except: [:index, :show, :search]
 before_action :set_feed, only: [:destroy, :show, :edit, :favorite, :update]
 before_action :top_feeds, only: [:index, :my_feeds]

  def index
    @sourse = Source.all
    @feeds = SearchFilter.new(params[:filter]).scope.current_page(params[:page]) if params[:filter]
    @feeds = SearchFilter.new(params[:title_search]).scope.current_page(params[:page]) if params[:title_search]
    @feeds  = Feed.current_page(params[:page]).order("created_at DESC") unless params[:filter] || params[:title_search]
    @caterories = Category.all
  end
  def search 
    @feeds = SearchFilter.new(params[:title_search]).scope.current_page(params[:page]) if params[:title_search]
    render json: @feeds
  end 
  def show
    @categories = Category.all.order("view_count DESC")
    add_view_to_feed(@feed)
    unless @feed
      render text: "PAge not found", status: 404
    end
  end

  def new
    @feed = Feed.new
    authorize! :new, Feed
  end

  def my_feeds
      @feeds = Feed.where(source_id: current_user.sourse_mass_id ).order("created_at DESC")
        .paginate(:page => params[:page], :per_page => 20)
      last_seen
  end

  def favorite
     add_or_destroy_favorite(@feed)
  end

  def update_news
     get_rss
     respond_to do |format|
       format.html { redirect_to feeds_url, notice: 'Новости успешно добавлены.' }
       format.json { head :no_content }
     end
  end

  def edit
    authorize! :edit, @feed
  end

  def create
    #add_params_to_create_hash
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
    authorize! :create, Feed
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
    authorize! :update, @feed
  end
  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, success: 'Новость успешно удалена' }
      format.json { head :no_content }
    end
    authorize! :destroy, @feed
  end
  private



  def add_params_to_create_hash(create_params)
    fix_params = {source_id: 3}
    create_params.marge(fix_params)
  end

  def set_feed
      @feed = Feed.find(params[:id])
  end

  def feed_params
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
