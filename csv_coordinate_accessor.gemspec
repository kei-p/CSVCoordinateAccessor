# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'csv_coordinate_accessor/version'

Gem::Specification.new do |spec|
  spec.name          = "csv_coordinate_accessor"
  spec.version       = CSVCoordinateAccessor::VERSION
  spec.authors       = ["Keisuke Ishizawa"]
  spec.email         = ["k_ishizawa@sfidante.co.jp"]

  spec.summary       = %q{module for setter and getter with coordinate like csv.}
  spec.description   = %q{module for setter and getter with coordinate like csv.}
  spec.homepage      = "https://github.com/kei-p/CSVCoordinateAccessor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
