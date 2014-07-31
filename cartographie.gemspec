# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cartographie/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matt Polito", "Matthew Conway"]
  gem.email         = ["matt.polito@gmail.com"]
  gem.description   = %q{Beautiful map generation}
  gem.summary       = %q{Wrapper for Google's Static Maps API}
  gem.homepage      = "https://github.com/mattpolito/cartographie"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cartographie"
  gem.require_paths = ["lib"]
  gem.version       = Cartographie::VERSION

  gem.add_dependency("addressable")
  gem.add_development_dependency("rake")
  gem.add_development_dependency("rspec", "~>2.13")
end
