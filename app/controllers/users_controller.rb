class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:update, :profile_setup, :show, :profile]
  def profile
   end

  def profile_setup
     @source = Source.all
  end

  def update
    puts user_params[:sourse_mass_id]

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
