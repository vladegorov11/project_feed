class Source < ApplicationRecord
  has_many :feeds , dependent: :destroy
  has_and_belongs_to_many :categories
  validates :name, :api_url, :description_url, presence:  true 
end
