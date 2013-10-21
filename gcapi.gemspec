# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gcapi/version'

Gem::Specification.new do |spec|
  spec.name          = "gcapi"
  spec.version       = Gcapi::VERSION
  spec.authors       = ["Robert Williams"]
  spec.email         = ["rob@r-williams.com"]
  spec.description   = %q{Unofficial wrapper for the Google Content API}
  spec.summary       = %q{Unofficial wrapper for the Google Content API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.8"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
