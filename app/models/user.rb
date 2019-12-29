# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :validatable

  validates :password, presence: true
  validates :email, presence: true, uniqueness: true
end
