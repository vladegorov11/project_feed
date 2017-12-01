class Tweet < ApplicationRecord
  belongs_to :user

 # TwitterApiFeed.new(current_user).delay_for(2.minutes).get_home_timeline
end
