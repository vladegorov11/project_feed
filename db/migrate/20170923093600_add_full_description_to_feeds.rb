class AddFullDescriptionToFeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :feeds, :full_description, :string
  end
end
