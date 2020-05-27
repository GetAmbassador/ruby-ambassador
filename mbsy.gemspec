# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mbsy/version'

Gem::Specification.new do |s|
  s.name    = 'mbsy'
  s.version = Mbsy::VERSION
  s.summary = 'A Ruby wrapper for the Ambassador API'
  s.description = ''
  s.author = 'Tom Mullen, Chase Lee'
  s.email = 'support@getambassador.com'
  s.homepage = 'http://github.com/GetAmbassador/mbsy'
  s.license = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.required_ruby_version = ">= 1.9.2"

  s.add_runtime_dependency('httparty', '0.14.0')
  s.add_runtime_dependency('json', '2.3.0')

  s.add_development_dependency('rake', '12.3.3')
  s.add_development_dependency('rspec', '3.5.0')
  s.add_development_dependency('webmock', '2.3.2')
  s.add_development_dependency('faker', '1.7.3')
  s.add_development_dependency('shoulda-matchers', '3.1.1')
  s.add_development_dependency('activesupport', '5.0.2')
end
