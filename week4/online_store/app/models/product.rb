class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category

  validates :name, presence: true, length: {maximum: 40}, uniqueness: true
  validates :price, presence: true
  validates_numericality_of :price, :quantity
  validates_presence_of :quantity
  validates_presence_of :category
  validates_presence_of :brand

  scope :with_offset, ->(offset) { where("id > ?", offset) }
end