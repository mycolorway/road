#
#ource 'https://rubygems.org'
source 'http://ruby.taobao.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'carrierwave'
gem 'mini_magick'
gem 'rest-client'
gem 'yettings'
gem 'better_logging'
gem 'cache_digests'
gem 'jquery-rails'
gem 'devise'#, github: 'plataformatec/devise', tag: 'v3.0.0.rc'
gem 'devise-i18n'
gem 'cancan'
gem 'simple_form'#, github: 'plataformatec/simple_form', tag: 'v3.0.0.rc'
gem 'draper'
gem 'kaminari'
#gem 'slim-rails'
gem 'jbuilder'
gem 'capistrano-rbenv', require: nil
gem 'capistrano-foreman', require: nil#, github: 'hyperoslo/capistrano-foreman'
gem 'foreman', require: nil
gem 'rails-i18n'
gem 'clockwork', require: nil
gem 'sidekiq'
gem 'thin'
gem 'quiet_assets'
gem 'nokogiri'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  #gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier'#, '>= 1.0.3'
  gem 'turbo-sprockets-rails3'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'ffaker'
end

group :development do
  gem 'annotate', require: nil
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'

  # Guard
  gem 'guard-bundler'
  # gem 'guard-rspec'
  gem 'guard-rails'
  gem 'guard-livereload'
  gem 'rack-livereload'

  # Notification System
  # Console
  gem 'terminal-notifier', require: RUBY_PLATFORM.downcase.include?('darwin') && 'terminal-notifier'
  # Guard
  gem 'terminal-notifier-guard', require: RUBY_PLATFORM.downcase.include?('darwin') && 'terminal-notifier-guard'
  # Listen to the changes of the file system
  gem 'rb-fsevent', require: false # For OSX
  gem 'rb-inotify', require: false # For Linux, 珍爱身边的linux用户
end

group :test do
  gem 'rspec-rails',      '2.11.0'
  gem 'database_cleaner', require: nil
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
