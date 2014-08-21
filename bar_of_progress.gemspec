# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bar_of_progress/version'

Gem::Specification.new do |spec|
  spec.name          = "bar-of-progress"
  spec.version       = BarOfProgress::VERSION
  spec.authors       = ["Justin Searls"]
  spec.email         = ["searls@gmail.com"]
  spec.summary       = %q{Render custom textual progress bars}
  spec.description   = %q{Render custom textual progress bars with a simple little API}
  spec.homepage      = "https://github.com/searls/bar-of-progress"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
