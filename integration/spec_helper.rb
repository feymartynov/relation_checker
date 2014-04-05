require 'rails/all'
require 'coveralls'
require 'relation_checker'

Coveralls.wear_merged!

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation

  config.before do
    require 'nulldb_rspec'
    ActiveRecord::Base.establish_connection adapter: :nulldb
  end
end
