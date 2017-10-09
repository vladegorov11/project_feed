class AddDescriptionToSources < ActiveRecord::Migration[5.1]
  def change
    add_column :sources, :description_url, :string
    add_column :sources, :image_url, :string
  end
end
