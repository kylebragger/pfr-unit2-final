class User < ActiveRecord::Base
  has_secure_password
  
  # allow mass assignment for the following fields:
  attr_accessible :email, :password, :username, :profile_fg, :profile_bg, :profile_image, :profile_image_file
  
  attr_accessor :profile_image_file
  
  # validations
  validates :email, :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: { on: :create }, length: { minimum: 6, on: :create }
  validates :username, length: { in: 1..40 }
  validates :email, format: /@/
  validates :username, format: /\A([a-z])([_a-z0-9]*)\z/i
  validate :check_reserved_usernames
  
  # associations
  has_many :shouts, dependent: :destroy, order: 'created_at DESC'
  has_many :follows, dependent: :destroy, order: 'id DESC', class_name: 'Follow', foreign_key: 'user_id'
  has_many :followers, dependent: :destroy, order: 'id DESC', class_name: 'Follow', foreign_key: 'follow_id'

  def follows?(user)
    Follow.exists?(user_id: self.id, follow_id: user.id)
  end

  # methods after this keyword will be protected methods
  protected

  # this is a custom validation method which will add an error to the username attribute
  # if the username is reserved (that is, if the username is not allowed).
  #
  # note that the check is case insensitive.
  def check_reserved_usernames
    reserved = %w{admin kyle leo}
    self.errors.add(:username, 'is not allowed') if reserved.include?(self.username.to_s.downcase.strip)
  end
end
