class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  has_and_belongs_to_many :movies

  validates :comment, comparison: { greater_than: 6 }
  validates :movie, uniqueness: { scope: :list }
end
