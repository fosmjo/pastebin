Sidekiq.configure_server do |config|
  config.redis = {
      host: Settings.sidekiq.redis.host,
      port: Settings.sidekiq.redis.port,
      password: Settings.sidekiq.redis.password,
      db: 12,
      network_timeout: 3
  }
  config.average_scheduled_poll_interval = 5
end

Sidekiq.configure_client do |config|
  config.redis = {
      host: Settings.sidekiq.redis.host,
      port: Settings.sidekiq.redis.port,
      password: Settings.sidekiq.redis.password,
      db: 12,
      network_timeout: 1
  }
end

require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]
