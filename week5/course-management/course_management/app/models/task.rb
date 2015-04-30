class Task < ActiveRecord::Base
  validate :name, presence: true, length: {maximum: 255}
  validate :description, presence: true
end
