class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader          :avatar, AvatarUploader
  has_and_belongs_to_many :feeds
  has_many                :comments
  has_many                :tweets, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable
  serialize :sourse_mass_id, Array

  def self.admin?
    current_user.admin
  end
end
