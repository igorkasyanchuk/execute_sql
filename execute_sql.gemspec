$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "execute_sql/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "execute_sql"
  spec.version     = ExecuteSql::VERSION
  spec.authors     = ["Igor Kasyanchuk"]
  spec.email       = ["igorkasyanchuk@gmail.com"]
  spec.homepage    = "https://github.com/igorkasyanchuk/execute_sql"
  spec.summary     = "Execute SQL directly in rails console or in the code."
  spec.description = "Execute SQL directly in rails console or in the code."
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails"
  spec.add_dependency 'terminal-table'

  spec.add_development_dependency "sqlite3", '~> 1.3.13'#, platforms: :ruby
  spec.add_development_dependency "pry-rails"
end
