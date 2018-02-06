class Feed < ApplicationRecord

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to              :source
  has_and_belongs_to_many :users
  has_many                :comments, dependent: :destroy

  scope :default, -> { order("created_at DESC") }
  scope :current_page, -> (page) do
    paginate(:page => page, :per_page => per_page)
  end

  def self.per_page
    20
  end
end
