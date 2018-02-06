class ExchangeRateWorker
  include Sidekiq::Worker

  def perform()
    ExchangeRate.get_exchange_rates
  end
  
end