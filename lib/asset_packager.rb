require 'synthesis/asset_package'
require 'synthesis/asset_package_helper'
require 'synthesis/railtie' if defined?(Rails::Railtie)
ActionView::Base.send :include, Synthesis::AssetPackageHelper
