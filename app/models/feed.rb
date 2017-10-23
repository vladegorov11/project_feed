class Feed < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to              :source
  has_and_belongs_to_many :users
  has_many                :comments, dependent: :destroy
end
