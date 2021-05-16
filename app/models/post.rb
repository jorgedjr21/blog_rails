class Post < ApplicationRecord
  extend Enumerize

  CATEGORIES = %i[games development movies other].freeze

  belongs_to :author
  has_rich_text :content
  has_many :comments, dependent: :destroy

  enumerize :category, in: CATEGORIES, default: :other

  validates :content, :title, :description, :category, presence: true
end
