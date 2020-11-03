class Meme < ApplicationRecord
  acts_as_votable
  acts_as_taggable_on :tags
  acts_as_taggable_on :usertags
  validates :title, presence: true
  has_one_attached :photo
  belongs_to :user
end
