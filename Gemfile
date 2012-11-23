source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

# Presentation
gem 'haml-rails'
gem 'draper'
gem 'rails-i18n'
gem 'd3_rails'
gem 'fugue_icons_rails'
gem 'dynamic_form'
gem 'ruby-graphviz'
gem 'awesome_nested_fields'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'twitter-bootstrap-rails'
  gem 'less-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'
gem 'thin'
gem 'SyslogLogger', :require => 'syslog_logger'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :development do
  gem 'pry'
  gem 'pry-rails'
  gem 'hirb'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'minitest'
  gem 'factory_girl_rails'
end

group :scraping do
  gem 'watir-webdriver'
  gem 'nokogiri'
  gem 'activerecord-import'
end
