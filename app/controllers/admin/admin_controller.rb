class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  layout 'admin.html.erb'

  rescue_from CanCan::AccessDenied do |exeption|
    redirect_to root_path , danger: "Страница не существует "
  end

  protected

  def check_admin
    authorize! :manage, :all
  end
end
