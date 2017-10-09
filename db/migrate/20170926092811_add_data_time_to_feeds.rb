class AddDataTimeToFeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :feeds, :data_time, :datetime
  end
end
