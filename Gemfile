source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.4"

# Rails本体を7系にする（ここが一番大事）
gem "rails", "~> 7.1.0"

# Rails 7 に合わせる
gem "rails-i18n", "~> 7.0"

gem "devise"
gem "devise-i18n"

# DB
gem "pg", "~> 1.1"

# Webサーバ
gem "puma", "~> 5.0"

# Rails 7ならsass-railsよりこっちのほうが無難
gem "sassc-rails"

# いったんWebpackerは残しておく（後でjsbundlingに移行でもOK）
gem "webpacker", "~> 5.0"

# turbolinksは古いから一旦外すか、後で turbo-rails 入れる
# gem "turbolinks", "~> 5"
gem "turbo-rails"

gem "jbuilder", "~> 2.7"

gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "pry-byebug"
  gem "pry-rails"
  gem "pry-doc"
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "rack-mini-profiler", "~> 2.0"
  gem "listen", "~> 3.3"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "kaminari"
gem "kaminari-i18n"
