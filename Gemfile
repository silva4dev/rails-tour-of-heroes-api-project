source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"
gem "rails", "~> 7.0.4"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "bcrypt", "~> 3.1"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "active_model_serializers", "~> 0.10.13"
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "faker", "~> 3.0"
end

gem "jwt", "~> 2.5"
