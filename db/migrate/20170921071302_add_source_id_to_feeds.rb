class AddSourceIdToFeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :feeds, :source_id, :integer
    add_index :feeds, :source_id
  end
end
