class Comment < ActiveRecord::Base
  attr_accessible :body, :post_id
  validates :body, :presence => true, :length => { :minimum => 10, :maximum => 200 }
  belongs_to :post
end
