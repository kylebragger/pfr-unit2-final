class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :username
  
  validates :email, :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: { on: :create }, length: { minimum: 6 }
  validates :username, length: { in: 1..40 }
  validates :email, format: /@/
  validates :username, format: /\A([a-z])([_a-z]*)\z/i
  validate :check_reserved_usernames
  
  protected
  
  def check_reserved_usernames
    reserved = %w{admin kyle leo}
    self.errors.add(:username, 'is not allowed') if reserved.include?(self.username.downcase)
  end
end
