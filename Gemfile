source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'devise'
gem 'rexml', '~> 3.2.5'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
gem 'puma', '~> 5.0'
gem 'webpacker', '~> 5.0'
gem 'jbuilder', '~> 2.7'
gem 'rails-i18n'
gem 'carrierwave'
gem 'rmagick'
gem 'fog-aws'
gem 'mailjet'
gem 'pundit', '~> 2.1.0'
gem 'bootsnap', '>= 1.4.4', require: false


group :development, :test do
  gem 'byebug'
  gem 'sqlite3', '~> 1.4'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rack-mini-profiler', '~> 2.0'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'letter_opener'
  gem 'capistrano', '~> 3.8'
  gem 'capistrano-rails', '~>1.6'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-bundler', '~> 1.6.0'
end

group :production do
  gem 'pg'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
