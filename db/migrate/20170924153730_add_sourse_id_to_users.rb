class AddSourseIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sourse_mass_id, :string
  end
end
