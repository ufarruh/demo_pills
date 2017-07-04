source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.0'

gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'

gem 'mail', '~> 2.6.4'
gem 'execjs', '~> 2.7.0'
gem 'mime-types', '~> 3.1'
gem 'erubis',  '~> 2.7.0'
gem 'therubyracer'

gem 'angularjs-rails'
gem 'angular_rails_csrf'
gem 'rails_admin', '~> 1.1.1'

gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '>= 3.2'
gem 'rails_12factor', group: :production
gem 'angular-ui-bootstrap-rails'
gem 'faker'
gem 'devise'



source "https://rails-assets.org" do
  gem "rails-assets-angular-devise"
end
# gem 'will_paginate', '~> 3.1.0'
gem 'kaminari'
gem 'rack-cors', :require => 'rack/cors'



group :development, :test do
  gem 'byebug', platform: :mri
end

group :development, :test do
  gem 'jazz_fingers'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
