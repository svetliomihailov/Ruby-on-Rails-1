class Task < ActiveRecord::Base
  belongs_to :lecture
  has_many :solutions, dependent: :destroy

  validates :name, presence: true, length: {maximum: 255}
  validates :description, presence: true
  validates :lecture, presence: true
end
