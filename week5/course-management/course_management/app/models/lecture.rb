class Lecture < ActiveRecord::Base
  validate :name, presence: true, length: {maximumm: 255}
  validate :body, presence: true
end
