class CreateCategoriesSources < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_sources, id: false do |t|
      t.integer :category_id, index: true
      t.integer :source_id, index: true
    end
  end
end
