class Lecture < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  validates :name, presence: true, length: {maximum: 255}
  validates :body, presence: true
end
