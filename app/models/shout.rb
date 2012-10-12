class Shout < ActiveRecord::Base
  attr_accessible :content, :user
  
  validates :content, presence: true, length: { maximum: 140 }
end
