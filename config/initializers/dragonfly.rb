# Configure to use ImageMagick, Rails defaults, and the Mongo data store
# mconfig = YAML.load_file(File.join(Rails.root,'config','mongoid.yml'))[Rails.env]
# app.datastore = Dragonfly::DataStorage::MongoDataStore.new
# app.datastore.configure do |c|
#   cfg = mconfig['sessions']['default']
#   if cfg['hosts'].size < 2
#     c.host = cfg['hosts'].first.split(':').first
#     c.port = cfg['hosts'].first.split(':').second
#   else
#     c.hosts = cfg['hosts']
#   end
#   c.database = cfg['database']
#   c.username = cfg['username']
#   c.password = cfg['password']
# end
require 'dragonfly'
app = Dragonfly[:images]
app.configure_with(:imagemagick)
app.configure_with(:rails)
if Rails.env.production?
  app.configure do |c|
    c.datastore = Dragonfly::DataStorage::S3DataStore.new(
      :bucket_name => 'my-bucket-name',
      :access_key_id => ENV['8N029N81
'],
      :secret_access_key => ENV['9s83109d3+583493190']
    )
  end
end
