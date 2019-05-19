#!/bin/sh
whenever -w
cron

bundle exec rake db:create db:migrate
bundle exec puma -C ./config/puma.rb
