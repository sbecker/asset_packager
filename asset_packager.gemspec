# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "asset_packager"
  spec.version       = "0.1.2"
  spec.authors       = ["Scott Becker"]
  spec.email         = ["becker.scott@gmail.com"]

  spec.summary       = "asset_packager"
  spec.description   = "asset_packager"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 5", ">= 5.2.6"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "mocha", "~> 1.1"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"

  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-gitlab-security"
  spec.add_development_dependency "rubocop-minitest"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-rails"
  spec.add_development_dependency "rubocop-rake"
  spec.metadata["rubygems_mfa_required"] = "true"
end
