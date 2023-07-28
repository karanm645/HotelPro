source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"
gem "rails", "~> 7.0.5", ">= 7.0.5.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'rubocop', require: false
gem "redis", "~> 4.0"

group :development, :test do
  #gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'pry'
  gem 'launchy'
  gem 'orderly'
end

group :development do
  gem "web-console"

end

group :test do
  gem 'shoulda-matchers', '~> 5.0' 
  gem 'rspec-rails' 
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'simplecov', require: false, group: :test
  gem "rspec_junit_formatter", require: false
end

# maybe useful in future --> gems
  # gem "rack-mini-profiler"
  # gem "spring"

  # gem "kredis"
  # gem "bcrypt", "~> 3.1.7"
  # gem "sassc-rails"
  # gem "image_processing", "~> 1.2"
gem "dockerfile-rails", ">= 1.5", :group => :development
