#!/usr/bin/env bash
# bin/render-build.sh
set -o errexit

bundle install
# Use Yarn to respect the repository's `yarn.lock` and avoid Bun/npm mismatches on Render
yarn install --frozen-lockfile
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate