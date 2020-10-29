class AddSampleIdAndCategoryIdToSampleCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :sample_categories, :sample_id, :integer
    add_column :sample_categories, :category_id, :integer
  end
end
