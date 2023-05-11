class Repo < ApplicationRecord
    belongs_to :language
    has_many :bookmarks, dependent: :destroy
end
