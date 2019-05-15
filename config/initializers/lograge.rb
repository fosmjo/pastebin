Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.keep_original_rails_log = true
  config.lograge.formatter = Lograge::Formatters::Logstash.new
  config.lograge.logger = ActiveSupport::Logger.new(STDOUT)

  config.lograge.custom_options = lambda do |event|
    exceptions = %w(controller action format id)
    {
      request_ip: event.payload[:request_ip],
      user_agent: event.payload[:user_agent],
      user_id: event.payload[:user_id],
      params: event.payload[:params].except(*exceptions),
      request_id: event.payload[:request_id],
      response_body: event.payload[:response_body]
    }
  end
end