class AddDefaultSourceToSource < ActiveRecord::Migration[5.1]
  def change
    add_column :sources, :default_source, :boolean, default: false
  end
end
