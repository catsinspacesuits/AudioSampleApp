class AddAudioDataToSamples < ActiveRecord::Migration[5.2]
  def change
    add_column :samples, :audio_data, :text
  end
end
