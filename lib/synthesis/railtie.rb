require 'rails'
require 'synthesis'

module Synthesis
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      ActiveSupport.on_load :action_view do
        ActionView::Base.send :include, Synthesis::AssetPackageHelper
      end
    end

    rake_tasks do
      load "tasks/asset_packager_tasks.rake"
    end
  end
end
