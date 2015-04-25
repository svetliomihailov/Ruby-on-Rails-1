class Brand < ActiveRecord::Base
  has_many :products

  validates :name, presence: true, length: {maximum: 40}, uniqueness: true
  validates :description, presence: true, length: {maximum: 140}

  scope :with_offset, ->(offset) { where("id > ?", offset) }
end