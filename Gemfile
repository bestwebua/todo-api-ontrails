source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# System
gem 'bootsnap', '>= 1.1.0', require: false
gem 'pg'
gem 'puma'
gem 'rails'
gem 'sidekiq'
gem 'sidekiq-cron'

# Auth
gem 'bcrypt'
gem 'jwt'
gem 'jwt_sessions'

# Trailblazer
gem 'trailblazer-endpoint', github: 'trailblazer/trailblazer-endpoint'
gem 'trailblazer-rails'
gem 'reform-rails'

# Serializer
gem 'jsonapi-rails', github: 'jsonapi-rb/jsonapi-rails'

group :development, :test do
  # Debuggers
  gem 'pry-byebug'
  gem 'pry-rails'

  # Linters
  gem 'rubocop-rails'
  gem 'rubocop-rspec'

  # Tests
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'faker'
  gem 'database_cleaner'
  gem 'json_matchers'

  # Documentation
  gem 'dox'
end

group :test do
  gem 'rspec_file_chef'
  gem 'rspec-sidekiq'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
end
