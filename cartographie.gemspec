# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cartographie/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matthew Conway"]
  gem.email         = ["mattonrails@shortmail.com"]
  gem.description   = %q{Beautiful map generation}
  gem.summary       = %q{Wrapper for Google's Static Maps API}
  gem.homepage      = "http://github.com/mattonrails/cartographie"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cartographie"
  gem.require_paths = ["lib"]
  gem.version       = Cartographie::VERSION

  gem.add_development_dependency("rake")
  gem.add_development_dependency("rspec", "~>2.11")
end
