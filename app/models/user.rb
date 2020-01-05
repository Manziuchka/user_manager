class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :validatable

  validates :email, presence: true, uniqueness: true
end
