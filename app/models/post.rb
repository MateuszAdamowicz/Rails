class Post < ActiveRecord::Base
  attr_accessible :body, :title, :category_id
  validates :body, :presence => true, :length => { :minimum => 20, :maximum => 1000 }
  validates :title, :presence => true, :length => { :minimum => 4, :maximum => 100 }
  validates_uniqueness_of :title
  belongs_to :categories
  has_many :comments
end
