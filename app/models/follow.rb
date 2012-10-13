class Follow < ActiveRecord::Base
  attr_accessible :user, :follow
  
  belongs_to :user
  belongs_to :follow, class_name: 'User'
end
