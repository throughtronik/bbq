source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'carrierwave', '~> 2.2.2'
gem 'devise', '~> 4.8.0'
gem 'fog-aws', '~> 3.10.0'
gem 'jbuilder', '~> 2.7'
gem 'mailjet', '~>1.6.0'
gem 'omniauth-facebook', '~> 8.0.0'
gem 'omniauth-oauth2', '~> 1.7.0'
gem 'omniauth-rails_csrf_protection', '~> 1.0.0'
gem 'omniauth-vkontakte', '~> 1.7.0'
gem 'puma', '~> 5.0'
gem 'pundit', '~> 2.1.0'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
gem 'rails-i18n', '~> 6.0.0'
gem 'resque', '~> 2.0.0'
gem 'rmagick', '~> 4.2.2'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug'
  gem 'pry-rails'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'capistrano', '~> 3.8'
  gem 'capistrano-bundler', '~> 1.6.0'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rails', '~>1.6'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-resque', '~> 0.2.3', require: false
  gem 'letter_opener', '~> 1.7.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :production do
  gem 'pg'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'factory_bot_rails', '~> 5.2'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
