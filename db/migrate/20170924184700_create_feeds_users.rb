class CreateFeedsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :feeds_users, id: false do |t|
      t.integer :feed_id, index: true
      t.integer :user_id, index: true
    end
  end
end
