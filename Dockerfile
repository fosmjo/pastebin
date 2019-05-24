FROM ruby:2.6.3
RUN apt-get update && apt-get -y install cron nodejs
RUN touch /var/log/whenever.log && chmod go+rw /var/log/whenever.log
ENV RAILS_ENV=production
ENV RACK_ENV=production
ENV PORT=80
WORKDIR /pastebin
COPY Gemfile /pastebin/Gemfile
COPY Gemfile.lock /pastebin/Gemfile.lock
RUN bundle install --without development test
COPY ./ /pastebin/
RUN mkdir -p tmp/pids
EXPOSE 80
HEALTHCHECK CMD curl -f http://localhost/healths/check || exit 1
RUN chmod u+x /pastebin/start.sh
CMD ["/pastebin/start.sh"]
