source 'https://rubygems.org'
#ruby '2.1.2'

def darwin_only(require_as)
  RUBY_PLATFORM.include?('darwin') && require_as
end

def linux_only(require_as)
  RUBY_PLATFORM.include?('linux') && require_as
end

group :production, :staging do
  gem 'rack-cache', :require => 'rack/cache'
end

gem 'rails', '~> 4.0'
gem 'dalli'
gem 'exception_notification'

# Server
gem 'unicorn' #staging and production
gem 'thin', group: :development

# Heroku
gem 'rails_12factor'
gem 'rails_serve_static_assets'

# Database
gem 'pg'
# gem 'activerecord-postgres-hstore'

# Admin
gem 'activeadmin', github: 'activeadmin'

# Authentication & permissions
gem 'devise'
gem 'cancancan', '~> 1.9'

# Templating
gem 'haml-rails'

# Form helpers
gem 'simple_form', '3.1.0.rc2'
gem 'nested_form'

# Pagination
# gem 'kaminari'

# Date and time
gem 'chronic'

# to hide IDs!
gem 'obfuscate_id', :git => 'https://github.com/namick/obfuscate_id.git'

# Queues
# gem 'queue_classic'

# Javascript/CSS
gem 'jquery-rails'
gem 'sass-rails','>= 4.0.0'
gem 'coffee-rails','>= 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap-sass', '~> 3.2.0.1'
gem 'momentjs-rails'
gem 'bootstrap-datepicker-rails'
gem 'autoprefixer-rails'
gem 'video_info'

group :development do
  gem 'letter_opener'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rails-erd'
  gem 'annotate'
end
