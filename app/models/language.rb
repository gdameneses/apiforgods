class Language < ApplicationRecord
  has_many :repos, dependent: :destroy
  validates :name, uniqueness: true
end
