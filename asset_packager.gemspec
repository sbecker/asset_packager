# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "asset_packager"
  spec.version       = 0.1.1
  spec.authors       = ["Scott Becker"]
  spec.email         = ["becker.scott@gmail.com"]

  spec.summary       = %q{asset_packager}
  spec.description   = %q{asset_packager}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', ">= 4.2", "< 7"
  spec.add_dependency 'bigdecimal', '~> 1.3', '>= 1.3.5'

  spec.add_development_dependency "rake"
  spec.add_development_dependency 'bundler', ">= 1.17.3", "< 3"
  spec.add_development_dependency 'test-unit'
  spec.add_development_dependency 'mocha', '~> 1.1'
end
