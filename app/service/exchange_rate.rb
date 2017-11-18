require 'open-uri'
class ExchangeRate
   @@conntent_type = 'ER'
   def get_exchange_rates
     url = "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json"
     escaped_address = URI.escape(url)
     uri = URI.parse(escaped_address)
     response = Net::HTTP.get(uri)
     course = JSON.parse(response)
     data = Formatter.super_format(course, @@conntent_type)
   end


end
