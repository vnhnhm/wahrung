lib = File.expand_path '../lib', __FILE__
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include? lib
require 'wahrung/version'

RE = %r{^(test|spec|features)/}

Gem::Specification.new do |spec|
  spec.name          = 'wahrung'
  spec.version       = Wahrung::VERSION
  spec.authors       = ['Sebastián Palma']
  spec.email         = ['vnhnhm@gmail.com']

  spec.summary       = 'Handles different currency conversions.'
  spec.description   = 'Currency conversions, arithmetics operations and stuff.'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match RE }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename f }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16.a'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rake',  '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
