require 'action_controller/railtie'

require_relative "../lib/asset_packager.rb"

require 'test/unit'
require 'rubygems'
require 'rails'
require 'mocha'
require 'mocha/test_unit'

require 'minitest/autorun'
require 'rack/test'
require 'logger'

class AssetPackagerApplication < Rails::Application
  config.root = File.dirname(__FILE__)
  config.session_store :cookie_store, key: 'cookie_store_key'
  secrets.secret_key_base = 'secret_key_base'
  config.logger = Logger.new($stdout)
  Rails.logger  = config.logger
end

require 'rails/test_help'
