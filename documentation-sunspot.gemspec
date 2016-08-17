# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'documentation/sunspot/version'

Gem::Specification.new do |spec|
  spec.name          = "documentation-sunspot"
  spec.version       = Documentation::Sunspot::VERSION
  spec.authors       = ["jamesprior"]
  spec.email         = ["james.m.prior@gmail.com"]
  spec.summary       = %q{A search replacement for the documentation engine}
  spec.description   = %q{Documentation is a Rails engine which provides a complete system for managing a set of hierarchical documentation.  This gem allows document searching and fragment highlighting with the Sunspot gem and Apache's Solr search index.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
