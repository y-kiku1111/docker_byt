class CatchCopy < ApplicationRecord
  

  belongs_to :user
  has_many :likes
  has_many :users, through: :likes
  has_many :comments

  def self.search(search)
    return CatchCopy.all unless search
    CatchCopy.where('title LIKE(?)', "%#{search}%")
  end
end
