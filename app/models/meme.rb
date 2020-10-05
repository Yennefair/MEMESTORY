class Meme < ApplicationRecord
  acts_as_votable
  validates :title, presence: true
  validates :source, presence: true
  has_one_attached :photo
end
