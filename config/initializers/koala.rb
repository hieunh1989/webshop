# config/initializers/koala.rb
require 'koala'

Koala.configure do |config|
  config.graph_server = 'my-graph-mock.mysite.com'
  # other common options are `rest_server` and `dialog_host`
  # see lib/koala/http_service.rb
end