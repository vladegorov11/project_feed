class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.string :text
      t.string :url
      t.string :full_text
      t.string :user_name
      t.string :tweet_id, index: true
      t.string :user_url
      t.string :user_screen_name
      t.timestamps
    end
  end
end
