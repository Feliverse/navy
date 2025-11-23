#!/usr/bin/env bash
# bin/render-build.sh
set -o errexit

bundle install
npm install --legacy-peer-deps
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate