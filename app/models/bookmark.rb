class Bookmark < ApplicationRecord
  belongs_to :repo
  validates :repo, uniqueness: true
end
