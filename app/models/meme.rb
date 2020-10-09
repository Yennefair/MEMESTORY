class Meme < ApplicationRecord
  acts_as_votable
  acts_as_taggable_on :tags
  validates :title, presence: true
  validates :source, presence: true
  has_one_attached :photo
end
