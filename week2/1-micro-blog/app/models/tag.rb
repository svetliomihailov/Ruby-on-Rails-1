class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  TAG_REG_EX = /#\S+/


  validates :text, presence: true, length: { minimum: 2 }
  validates :text, length: { maximum: 255 }
  validates_format_of :text, with: TAG_REG_EX
end
