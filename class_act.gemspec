# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'class_act/version'

Gem::Specification.new do |spec|
  spec.name          = "class_act"
  spec.version       = ClassAct::VERSION
  spec.authors       = ["Steve Jorgensen"]
  spec.email         = ["stevej@stevej.name"]
  spec.summary       = "Provides checks and conveniences for Ruby classes implementing module-defined role APIs"
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
