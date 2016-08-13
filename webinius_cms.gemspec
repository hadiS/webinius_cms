$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "webinius_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "webinius_cms"
  s.version     = WebiniusCms::VERSION
  s.authors     = ["Hadi Samadi"]
  s.homepage    = "http://www.webinius.at"
  s.summary     = "Simple CMS Engine"
  s.description = "Coming later"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"

  s.add_dependency "pg"
  s.add_dependency 'coffee-rails'
  s.add_dependency "jquery-rails"
  s.add_dependency "bcrypt"
  s.add_dependency "sass-rails"
  s.add_dependency 'turbolinks'
  s.add_dependency 'ancestry'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'font-awesome-sass'
  s.add_dependency 'acts_as_list'
  s.add_dependency 'will_paginate'
  s.add_dependency 'will_paginate-bootstrap'
  s.add_dependency 'carrierwave'
  s.add_dependency 'mini_magick'
  s.add_dependency 'tinymce-rails'

  s.add_development_dependency 'byebug'
  s.add_development_dependency 'web-console'
  s.add_development_dependency 'powify'

end
