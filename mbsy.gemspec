Gem::Specification.new do |s|
  s.name    = 'mbsy'
  s.version = '1.0.0'
  s.date    = '2012-06-10'
  s.summary = 'A Ruby API wrapper for Ambassador'
  s.description = ''
  s.author = 'Tom Mullen'
  s.email = 'tom@zappdrewards.com'
  s.homepage = 'http://github.com/temullen/mbsy'
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.required_ruby_version = ">= 1.9.2"

  s.add_development_dependency('rake', '~> 0.9.2')
  s.add_development_dependency('rspec', '~> 2.7.0')
  s.add_development_dependency('factory_girl', '~> 2.1.0')
  s.add_development_dependency('fakeweb', '~> 1.3.0')
  s.add_development_dependency('faker', '~> 1.0.1')
  s.add_development_dependency('rb-fsevent', '~> 0.4.2')
  s.add_development_dependency("shoulda", ">= 0")
  s.add_development_dependency("bundler", "~> 1.0.0")
end