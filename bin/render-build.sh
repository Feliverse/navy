#!/usr/bin/env bash
# bin/render-build.sh
set -o errexit

bundle install
# Use Yarn to respect the repository's `yarn.lock` and avoid Bun/npm mismatches on Render
yarn install --frozen-lockfile
bundle exec rake assets:precompile
bundle exec rake assets:clean
# Do NOT run database migrations during the build step on Render.
# Running migrations in the build phase often fails because the build
# environment doesn't have access to the production database.
# Use Render's "Release Command" (or a manual/one-off job) to run
# `bundle exec rake db:migrate` after the deploy succeeds.
# bundle exec rake db:migrate