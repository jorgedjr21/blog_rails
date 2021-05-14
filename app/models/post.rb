class Post < ApplicationRecord
  extend Enumerize

  CATEGORIES = %i[games development movies other].freeze

  belongs_to :author
  has_rich_text :content

  enumerize :category, in: CATEGORIES, default: :other

  validates :content, :title, presence: true
end
