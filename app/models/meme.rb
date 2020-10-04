class Meme < ApplicationRecord
  validates :title, presence: true
  validates :source, presence: true
  has_one_attached :photo
  acts_as_votable
end
