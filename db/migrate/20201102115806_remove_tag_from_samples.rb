class RemoveTagFromSamples < ActiveRecord::Migration[5.2]
  def change
    remove_column :samples, :tag, :string
  end
end
