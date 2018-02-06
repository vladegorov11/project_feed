module Api
  module V1
		class TelegramSessionsController < ApplicationController
			before_action :check_oauth_token, only: :sign_in

			def sign_in
				if @checked == true
					user = user_verification 
					add_telegram_id_to_user	 unless user.blank?
				else
					"Неверный ключ"
				end	
			end

			private 

			def check_oauth_token
 				if params[:oauth_token] == TELEGRAM_OAUTH_TOKEN
 					@checked = true
 				else 
 					@checked = false
 				end	
			end

			def user_verification
				user = User.where(email: params[:email], password: params[:password])
			end

			def add_telegram_id_to_user
				
			end
		end
	end
end

