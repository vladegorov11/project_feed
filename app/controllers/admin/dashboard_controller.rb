class Admin::DashboardController < Admin::AdminController
  before_action :set_user, only: [:create_content_for_user]

  def index
    @categories = Category.order("view_count DESC")
    @all_category_count = all_category_count(@categories)
  end

  def all_user
    @user = User.all
  end

  def create_content_for_user
    if @user.create_feed == false
      @user.create_feed = true
      redirect_to admin_all_user_path, success: "Пользователю добавлено право на создание записей"
    else
      @user.create_feed = false
      redirect_to admin_all_user_path, success: "У пользователя удалено право на создание записей"
    end
    @user.save
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def all_category_count (categories)
    categories.inject(0){|sum,x| sum + x.view_count }
  end
end
