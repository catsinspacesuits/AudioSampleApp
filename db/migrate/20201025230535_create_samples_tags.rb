class CreateSamplesTags < ActiveRecord::Migration[5.2]
  def change
    create_table :samples_tags do |t|
      t.integer :sample_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
