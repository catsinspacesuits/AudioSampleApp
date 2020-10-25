class CreateCategoriesClips < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_samples do |t|
      t.integer :category_id
      t.integer :sample_id

      t.timestamps
    end
  end
end
