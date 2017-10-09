class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :link
      t.string :description
      t.string :image
      t.string :city
      t.string :street
      t.integer :event_id
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
