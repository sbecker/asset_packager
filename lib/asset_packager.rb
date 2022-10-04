# frozen_string_literal: true

require "synthesis/asset_package"
require "synthesis/asset_package_helper"
require "synthesis/railtie" if defined?(Rails::Railtie)
ActiveSupport.on_load(:action_view) { include Synthesis::AssetPackageHelper }
