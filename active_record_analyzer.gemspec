# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record_analyzer/version'

Gem::Specification.new do |spec|
  spec.name          = "active_record_analyzer"
  spec.version       = ActiveRecordAnalyzer::VERSION
  spec.authors       = ["Ariel Scherman"]
  spec.email         = ["arielscherman@gmail.com"]

  spec.summary       = %q{Analyze an ActiveRecord class to get information about its associations.}
  spec.description   = %q{Analyze an ActiveRecord class to get information about its associations. You will be able to know all its has_many and belongs_to for instance.}
  spec.homepage      = "https://github.com/arielscherman/active_record_analyzer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 4.0"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", ">= 0.11"
  spec.add_development_dependency "sqlite3", ">= 1.3"
end
