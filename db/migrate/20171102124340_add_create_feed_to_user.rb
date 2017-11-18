class AddCreateFeedToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :create_feed, :boolean, default: false
  end
end
