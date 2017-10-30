class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:update, :profile_setup, :show, :profile]
  
  def profile
      @categories = Category.order("view_count DESC")
      @all_category_count = @categories.inject(0){|sum,x| sum + x.view_count }
  end

  def profile_setup
     @source = Source.all
  end

  def update
    puts user_params[:sourse_mass_id]
    @comments = Comment.where(user_id: current_user.id)
    @comments.each do |comment|
      comment.update(author: user_params[:nick_name])
    end
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile_user_url, notice: 'Source was successfully updated.' }
        format.json { render :profile, status: :ok, location: @user }
      else
        format.html { render :profile_setup }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :nick_name, :avatar, :sourse_mass_id => [])
    end


end
