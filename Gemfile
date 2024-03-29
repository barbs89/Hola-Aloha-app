source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'

gem 'rails',        '~> 5.2.0'
gem 'pg',           '>= 0.18', '< 2.0'
gem 'puma',         '~> 5.5'
gem 'sass-rails',   '~> 5.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks',   '~> 5'
gem 'jbuilder',     '~> 2.5'
gem 'bootsnap',     '>= 1.1.0', require: false
gem 'language_list', '~> 1.1'


# Added Gems
gem 'devise',       '~> 4.7'
gem 'bcrypt', '~> 3.1', '>= 3.1.11'

gem 'pundit',       '~> 1.1'

gem 'stripe',       '~> 3.13'

gem 'mailgun-ruby', '~> 1.1', '>= 1.1.9'
gem 'faker',        '~> 1.8', '>= 1.8.7'
gem 'pg',           '>= 0.18', '< 2.0'


#Shrine despendecies
gem 'shrine',       '~> 3.3'
gem 'mini_magick', '~> 4.9'
gem 'fastimage', '~> 2.1', '>= 2.1.3'
gem 'image_processing', '~> 1.2'
gem 'aws-sdk-s3', '~> 1.9', '>= 1.9.1'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails',  '~> 3.7', '>= 3.7.2'
  gem 'dotenv-rails', '~> 2.4'
end


group :development do
  gem 'web-console',            '>= 3.3.0'
  gem 'listen',                 '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen',  '~> 2.0.0'
end


group :test do
  gem 'capybara',               '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]