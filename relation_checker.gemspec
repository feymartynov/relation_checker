Gem::Specification.new do |s|
  s.name         = 'relation_checker'
  s.version      = '0.0.0'
  s.date         = '2014-03-30'
  s.summary      = "ActeveRecord::Relation checker"
  s.description  = "Helper for checking ActeveRecord::Relation objects in test"
  s.authors      = ["Fey Martynov"]
  s.email        = 'feymartynov@gmail.com'
  s.files        = Dir['{lib/**/*,[A-Z]*}']
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.homepage     = 'http://github.com/durnoyabsurd/relation_checker'
  s.license      = 'MIT'

  s.add_dependency 'rails', '>= 3.2.0'
end
