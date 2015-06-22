$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "has_star/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "has_star"
  s.version     = HasStar::VERSION
  s.authors     = ["Marcos Neves"]
  s.email       = ["marcos.neves@gmail.com"]
  s.homepage    = "https://github.com/railslab/has_star"
  s.summary     = "Rails plugin to favorite models with a star."
  s.description = "Extends model, controller, helper and routes to handle the toggle of a star to favorite a model."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency "rails", "~> 4.0"

  s.add_development_dependency "sqlite3", "~> 1.3"
  s.add_development_dependency "jquery-rails", "~> 4.0"
end
