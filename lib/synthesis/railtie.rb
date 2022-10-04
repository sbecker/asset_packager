# frozen_string_literal: true

require "asset_packager"
require "rails"

module Synthesis
  class Railtie < Rails::Railtie
    rake_tasks do
      require "synthesis/tasks"
    end
  end
end
