source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# System
gem 'bootsnap', '>= 1.1.0', require: false
gem 'pg'
gem 'puma'
gem 'rails'

# Auth
gem 'devise'
gem 'jwt_sessions'

# Trailblazer
gem 'trailblazer-endpoint', github: 'trailblazer/trailblazer-endpoint'
gem 'trailblazer-rails'

# Serializer
gem 'jsonapi-rails', github: 'jsonapi-rb/jsonapi-rails'

# Documentation
gem 'dox'

group :development, :test do
  # Debuggers
  gem 'pry-byebug'
  gem 'pry-rails'

  # Linters
  gem 'rubocop-rails'
  gem 'rubocop-rspec'

  # Tests
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
