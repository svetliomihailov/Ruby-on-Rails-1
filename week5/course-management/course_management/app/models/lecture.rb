class Lecture < ActiveRecord::Base
  has_many :tasks

  validates :name, presence: true, length: {maximum: 255}
  validates :body, presence: true
end
