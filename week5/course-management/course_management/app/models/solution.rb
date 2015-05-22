class Solution < ActiveRecord::Base
  belongs_to :task

  validates :content, presence: true
  validates :task, presence: true
end
