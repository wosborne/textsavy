class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :blog

  has_rich_text :content
end
