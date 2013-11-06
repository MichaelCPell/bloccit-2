class Comment < ActiveRecord::Base
  attr_accessible :body, :post
  belongs_to :post
  
  #Add user Comment 
  belongs_to :user  
  validates :body, length: {minimum: 5}, presence: true 
  validates :user, presence: true 
end
