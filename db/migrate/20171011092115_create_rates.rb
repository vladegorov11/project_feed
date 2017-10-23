class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.string :name
      t.string :date_time
      t.string :title
      t.float :rate
      t.timestamps
    end
  end
end
