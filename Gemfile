source 'https://rubygems.org'

gem 'rails', '~> 5.0.0'
gem 'mysql2'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'slim'
gem 'slim-rails'
gem 'config'
gem 'figaro'
gem 'nprogress-rails'
gem "jquery-turbolinks"
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'
gem 'aui_flash', '~> 0.1.5'
gem 'browserify-rails'
gem 'react-rails'
gem "js-routes"
gem 'bootstrap-sass', '~> 3.3.6'


group :development, :test do
  gem 'byebug'
  gem 'pry'
  gem 'faker'
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem "selenium-webdriver"
  gem 'database_cleaner'
  gem 'rspec-wait', '~> 0.0.8'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'awesome_print'
  gem 'meta_request'
  gem 'brakeman', :require => false
end

group :staging, :development do
  gem 'bullet'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'newrelic_rpm'
  gem 'rack-mini-profiler'
end

group :test do
  gem 'guard-rspec'
  gem 'launchy'
end

# For deploy heroku
group :production do
  gem 'pg', '0.18.4'
  gem 'faker'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
