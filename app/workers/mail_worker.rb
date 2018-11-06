class MailWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(start_date, end_date)
    logger.debug "SIDEKIQ RECEIVED THE RENT FROM #{start_date} TO #{end_date}."
  end
end
