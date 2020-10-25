class CreateSamples < ActiveRecord::Migration[5.2]
  def change
    create_table :samples do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :tag
      t.string :file_type

      t.timestamps
    end
  end
end
