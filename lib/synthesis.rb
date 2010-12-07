module Synthesis
  autoload :AssetPackage, 'synthesis/asset_package'
  autoload :AssetPackageHelper, 'synthesis/asset_package_helper'
  autoload :JSMin, 'synthesis/jsmin'
end

require 'synthesis/railtie'
