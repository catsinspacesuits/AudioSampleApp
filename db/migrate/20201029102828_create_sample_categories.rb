class CreateSampleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :sample_categories do |t|

      t.timestamps
    end
  end
end
