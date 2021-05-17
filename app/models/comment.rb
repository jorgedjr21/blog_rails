class Comment < ApplicationRecord
  after_create_commit { broadcast_append_to 'comments' }
  belongs_to :post

  validates :content, :name, presence: true
end
