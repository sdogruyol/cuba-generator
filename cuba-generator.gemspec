# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cuba/generator/version'

Gem::Specification.new do |spec|
  spec.name          = 'cuba-generator-duo'
  spec.version       = Cuba::Generator::VERSION
  spec.authors       = ['Serdar Dogruyol Derek Viera']
  spec.email         = ['ma.dmviera01@gmail.com']
  spec.summary       = %q{Application Generator for Cuba framework.}
  spec.description   = %q{Helps create cuba projects through a minimalist generator.}
  spec.homepage      = 'https://github.com/rangeroob/cuba-generator-duo'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
  spec.add_dependency 'cuba', '~> 3.4.0'
  spec.add_runtime_dependency 'commander', '~> 4.3.0'
end
