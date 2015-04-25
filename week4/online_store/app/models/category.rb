class Category < ActiveRecord::Base
  has_many :products

  validates :name, presence: true, length: {maximum: 40}, uniqueness: true

  scope :with_offset, ->(offset) { where("id > ?", offset) }
end