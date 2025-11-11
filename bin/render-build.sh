#!/usr/bin/env bash
set -o errexit

# 1. Gem入れる
bundle install

# 2. JSパッケージ入れる（Webpacker用）
yarn install --check-files

RAILS_ENV=production bundle exec rails webpacker:compile

# 3. 本番用にアセットをビルド
RAILS_ENV=production bundle exec rails assets:precompile

# 4. 本番DBにマイグレーション
RAILS_ENV=production bundle exec rails db:migrate
