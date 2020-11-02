class RemoveCategoryFromSamples < ActiveRecord::Migration[5.2]
  def change
    remove_column :samples, :category, :string
  end
end
