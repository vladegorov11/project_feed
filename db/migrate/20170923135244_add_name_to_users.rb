class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatar, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nick_name, :string
  end
end
