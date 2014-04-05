require 'rails/all'
require 'coveralls'
require 'relation_checker'

Coveralls.wear!

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation
end
