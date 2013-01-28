class Comment < ActiveRecord::Base
  attr_accessible :body, :post_id, :user_id
  validates :body, :presence => true, :length => { :minimum => 10, :maximum => 200 }
  belongs_to :post
  belongs_to :user
end
