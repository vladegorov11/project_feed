require 'open_weather'
require 'json'
class WeatherMetrics
  APPID = Rails.application.secrets[:open_weather_key]
  attr_reader :temp, :min_temp, :max_temp, :wind_speed,
              :city, :req_options
  def initialize ( city_id, opts = {})
    @req_options = { units: "metric", APPID: APPID }
    #@req_options = @req_options.merge(opts)
    fetch!(city_id)
  end
  # def last!(city_id,days)
  #   options = { units: "metric", APPID: "bffebbbffac134d4523719fc5f232033", lang: "ru" }
  #   options[:cnt] = days
  #   weathers =  OpenWeather::ForecastDaily.city("#{city_id}", options)
  #   puts weathers
  # end
  # def self.fetch(*args)
  #   fetcher = new(*args)
  #   fetcher.fetch!
  # end

  def fetch!(city_id)
    puts city_id
    responce = OpenWeather::Current.city(city_id, @req_options)
    puts responce
  end

  private

  def load_city(city_id)
    @city = city_id
  end

end
