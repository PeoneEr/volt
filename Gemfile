source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'aasm'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'carrierwave', '~> 1.0'
gem 'coffee-rails', '~> 4.2'
gem 'haml'
gem 'hashie'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.4'
gem 'russian'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'capybara'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.5'
  gem 'simplecov', require: false
gem 'sqlite3'
end

group :development do
  gem 'annotate'
  gem 'listen', '~> 3.0.5'
  gem 'ordinare'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
