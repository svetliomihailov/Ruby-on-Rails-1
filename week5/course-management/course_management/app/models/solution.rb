class Solution < ActiveRecord::Base
  validate :content, presence: true
end
