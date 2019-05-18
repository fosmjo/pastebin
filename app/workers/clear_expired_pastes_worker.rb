class ClearExpiredPastesWorker
  include Sidekiq::Worker

  def perform(*_args)
    Paste.clear_expired_pastes
  end
end
