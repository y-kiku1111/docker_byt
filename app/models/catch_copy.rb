class CatchCopy < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :comments, dependent: :destroy



  def self.search(search)
    return CatchCopy.all unless search
    CatchCopy.where('title LIKE(?)', "%#{search}%")
  end
end
