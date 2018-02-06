require 'open-uri'
class ExchangeRate

   @@url = "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json"
   
   def get_exchange_rates
     escaped_address = URI.escape(@@url)
     uri = URI.parse(escaped_address)
     response = Net::HTTP.get(uri)
     course = JSON.parse(response)
     Formatter.new.format_exchange_rate(course)
   end

end
