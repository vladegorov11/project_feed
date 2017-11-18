require 'twitter'
module TwitterHelper
  def self.get_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = "SO2qkuI4gT8F0Xy2Djmt0lDNF"
      config.consumer_secret = 'qb3S83YjjoYFyG3BDQCNy5IWJW1l3ARDZTRT49C44ynIuyaG6F'
      config.access_token = '787720339795152896-1ZkEdK8EUAgNX2Hj98cEiIy80Qnwp9g'
      config.access_token_secret = 'HydkNzEZirAXfwapPzKcmSAOuPoUzFpZB8qMjzb1ztYpE'
    end
  end

  def get_client
    TwitterHelper.client
  end
end
