class CreateFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :link
      t.string :description
      t.string :date
      t.string :image

      t.timestamps
    end
  end
end
