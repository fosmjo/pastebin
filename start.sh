#!/bin/sh
whenever -w
cron

bundle exec rake db:migrate
bundle exec puma -C ./config/puma.rb
