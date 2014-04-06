require 'rails/all'
require 'coveralls'
require 'nulldb_rspec'
require 'checker_expectations'
require 'relation_checker'

Coveralls.wear_merged!

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation

  config.before do
    ActiveRecord::Base.establish_connection adapter: :nulldb
  end
end
