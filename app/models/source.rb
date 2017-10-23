class Source < ApplicationRecord
  has_many :feeds , dependent: :destroy
  has_and_belongs_to_many :categories
end
