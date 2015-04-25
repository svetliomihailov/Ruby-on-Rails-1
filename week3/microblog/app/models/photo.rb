class Photo < ActiveRecord::Base
  validates :title, presence: true, length: {maximum: 40}
  validates :url, presence: true, length: {maximum: 256}
end