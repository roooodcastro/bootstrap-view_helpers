$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'bootstrap/view_helpers/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'bootstrap-view_helpers'
  s.version     = Bootstrap::ViewHelpers::VERSION
  s.authors     = ['Rodrigo Castro Azevedo']
  s.email       = ['rod.c.azevedo@gmail.com']
  s.homepage    = 'http://github.com'
  s.summary     = 'PAFA: Summary of BootstrapViewHelpers.'
  s.description = 'PAFA: Description of BootstrapViewHelpers.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile',
                'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '>= 4'
  s.add_development_dependency 'rubocop', '~> 0.52'
end
