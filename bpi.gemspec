$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bpi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bpi"
  s.version     = Bpi::VERSION
  s.authors     = ["Samy KACIMI"]
  s.email       = ["samy@capsens.eu"]
  s.homepage    = "http://www.capsens.eu"
  s.summary     = "XML builder"
  s.description = "XML builder for Tous Nos Projets"
  s.license     = "Property"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.0.0"
  s.add_dependency "nokogiri"

  s.add_development_dependency "sqlite3"
end
