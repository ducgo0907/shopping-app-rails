require 'cloudinary'
require 'shrine/storage/cloudinary'

Cloudinary.config(
  cloud_name: ENV["dwrjzyqnw"],
  api_key: ENV["281794772576963"],
  api_secret: ENV["kmTH9L5BR_CUv6y-_VqVq8oqlkI"],   
)
Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: "cache"), # For direct upload
  store: Shrine::Storage::Cloudinary.new(prefix: "rails_upload")
}
Shrine.plugin :activerecord             # Load Active Record integration
Shrine.plugin :cached_attachment_data   # Enbales retaining cached file across form redisplays
Shrine.plugin :restore_cached_data      # extracts metadata for assigned cached files
Shrine.plugin :validation_helpers
Shrine.plugin :validation