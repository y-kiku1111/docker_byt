class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :catch_copies
  has_many :likes
  has_many :likes_catch_copies, through: :likes
end

