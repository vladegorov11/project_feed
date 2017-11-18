class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  layout 'admin.html.erb'
  protected

  def check_admin
    redirect_to root_path , :success => "У вас нет прав для просмотра этой страници" unless current_user.admin?
  end
end
