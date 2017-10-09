class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.string :name
      t.string :login
      t.string :password
      t.string :api_url

      t.timestamps
    end
  end
end
