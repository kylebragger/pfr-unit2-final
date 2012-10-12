class User < ActiveRecord::Base
  # allow mass assignment for the following fields:
  attr_accessible :email, :password_digest, :username
end
