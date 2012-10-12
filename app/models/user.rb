class User < ActiveRecord::Base
  # allow mass assignment for the following fields:
  attr_accessible :email, :password_digest, :username, :profile_fg, :profile_bg, :profile_image, :profile_image_file
  
  attr_accessor :profile_image_file
  
  # validations
  validates :email, :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: { on: :create }, length: { minimum: 6, on: :create }
  validates :username, length: { in: 1..40 }
  validates :email, format: /@/
  validates :username, format: /\A([a-z])([_a-z0-9]*)\z/i
  validate :check_reserved_usernames

  # methods after this keyword will be protected methods
  protected

  # this is a custom validation method which will add an error to the username attribute
  # if the username is reserved (that is, if the username is not allowed).
  #
  # note that the check is case insensitive.
  def check_reserved_usernames
    reserved = %w{admin kyle leo}
    self.errors.add(:username, 'is not allowed') if reserved.include?(self.username.downcase.strip)
  end
end
