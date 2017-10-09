class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :feed_id

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :feed_id
  end
end
