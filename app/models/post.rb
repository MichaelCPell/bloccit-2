class Post < ActiveRecord::Base
  attr_accessible :body, :title, :topic, :postimage
  has_many :comments, dependent: :destroy 
  belongs_to :user 
  belongs_to :topic
  mount_uploader :postimage, PostImageUploader 
  
  default_scope order('created_at DESC')

  validates :title, length: { minimum: 5 }, presence: true 
  validates :body, length: { minimum: 20 }, presence: true 
  validates :user, presence: true
  validates :topic, presence: true 

end
