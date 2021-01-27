ActiveAdmin.register Sample do
  permit_params :title, :description, :file_type, :audio_data, :channels, :sample_rate, :file_size
end
