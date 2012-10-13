class Shout < ActiveRecord::Base
  attr_accessible :content, :user, :tag_string
  attr_accessor :tag_string
  
  validates :content, presence: true, length: { maximum: 140 }
  
  belongs_to :user
  
  has_and_belongs_to_many :tags
  
  before_save :process_tags
  
  protected
  
  def process_tags
    tags = self.tag_string.split(' ')
    return if tags.empty?
    
    tags.each do |tag|
      t = Tag.find_or_create_by_name(tag.downcase)
      self.tags << t
    end
  end
end
