class Comment < ApplicationRecord
  belongs_to :post

  validates :content, :name, presence: true
end
