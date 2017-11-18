class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  ONLINE_PERIOD = 5.minutes

  scope :online, -> { where('updated_at > ?', ONLINE_PERIOD.ago) }

  def online?
    updated_at > ONLINE_PERIOD.ago
  end

  

end
