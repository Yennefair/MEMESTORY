class Meme < ApplicationRecord
  validates :title, presence: true
  validates :source, presence: true
  acts_as_votable
end
