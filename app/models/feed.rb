class Feed < ApplicationRecord
  belongs_to              :source
  has_and_belongs_to_many :users
  has_many                :comments
end
