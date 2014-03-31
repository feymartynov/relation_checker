require 'rails/all'
require 'relation_checker'

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation
end
