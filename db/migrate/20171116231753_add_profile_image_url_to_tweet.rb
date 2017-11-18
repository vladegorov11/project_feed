class AddProfileImageUrlToTweet < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :profile_image_url, :string
  end
end
