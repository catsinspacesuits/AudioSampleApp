class AddChannelsSampleRateAndFileSizeToSamples < ActiveRecord::Migration[5.2]
  def change
    add_column :samples, :channels, :string
    add_column :samples, :sample_rate, :string
    add_column :samples, :file_size, :float
  end
end
