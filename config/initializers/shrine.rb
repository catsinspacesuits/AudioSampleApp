require "shrine"
require "shrine/storage/s3"

s3_options = {
  access_key_id: Rails.application.credentials.digitalocean_spaces_key,
  secret_access_key: Rails.application.credentials.digitalocean_spaces_secret,
  bucket: Rails.application.credentials.digitalocean_spaces_bucket,
  endpoint: 'https://fra1.digitaloceanspaces.com',
  region: 'fra1'
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options), 
  store: Shrine::Storage::S3.new(prefix: "store", **s3_options)  
}

Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
Shrine.plugin :validation
Shrine.plugin :validation_helpers


