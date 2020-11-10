class CreateSampleLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :sample_libraries do |t|
      t.integer :sample_id
      t.integer :library_id

      t.timestamps
    end
  end
end
