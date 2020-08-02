class Photo < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :likes

  has_one_attached :image

  validates :image, presence: true
end
