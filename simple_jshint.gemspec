# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_jshint/version'

Gem::Specification.new do |gem|
  gem.name          = "simple_jshint"
  gem.version       = SimpleJSHint::VERSION
  gem.authors       = ["Tom Lea"]
  gem.email         = ["commit@tomlea.co.uk"]
  gem.description   = %q{A simple API to let you lint your code.}
  gem.summary       = %q{Use JSLint from Ruby.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "execjs"
  gem.add_dependency "multi_json"
  gem.add_development_dependency "rake"
end
