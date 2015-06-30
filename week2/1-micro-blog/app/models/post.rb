class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags

  validates :content, presence: true, length: {minimum: 1}
  validates :content, length: {maximum: 255}
end
