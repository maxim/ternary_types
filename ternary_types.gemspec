# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ternary_types/version'

Gem::Specification.new do |spec|
  spec.name          = "ternary_types"
  spec.version       = TernaryTypes::VERSION
  spec.authors       = ["Maxim Chernyak"]
  spec.email         = ["madfancier@gmail.com"]
  spec.summary       = %q{Use ternary types in your ruby apps.}
  spec.description   = 'Provides ternary singletons True, False, and Maybe '\
    'with ==,!,&,|,^ operators implemented according to three-value logic.'
  spec.homepage      = "https://github.com/maxim/ternary_types"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
