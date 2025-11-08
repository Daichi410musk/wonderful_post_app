source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.4"

# --- Rails core ---
gem "rails", "~> 7.1.0"
gem "rails-i18n", "~> 7.0"

# --- Authentication ---
gem "devise"
gem "devise-i18n"

# --- Database ---
gem "pg", "~> 1.5"

# --- Web server ---
gem "puma", "~> 6.4"

# --- Assets / Styles ---
gem "sassc-rails"

# --- JavaScript / Frontend ---
# Rails 7ではwebpackerは非推奨。
# 一時的に動かすならwebpackerを残してもOKだが、
# 将来的には jsbundling-rails に移行推奨。
gem "webpacker", "~> 5.0"
# gem "jsbundling-rails"   # ← 乗り換えるときはこちらに変更

# --- Turbo / Hotwire ---
gem "turbo-rails", "~> 2.0"

# --- JSON / Utilities ---
gem "jbuilder", "~> 2.7"
gem "bootsnap", ">= 1.4.4", require: false

# --- Pagination ---
gem "kaminari"
gem "kaminari-i18n"

# --- Development / Debugging ---
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

# --- Windows support (無視可) ---
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

